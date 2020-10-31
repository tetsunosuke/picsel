class Public::PhotosController < ApplicationController
    before_action :authenticate_user!
    def top
        @photos = Photo.all
    end
    def index
        @user = current_user
        @photos = Photo.where(user_id: current_user.id)
    end
    def new
        @photo = Photo.new
        @gallaries = Gallary.all
    end
    def create
        @photo = current_user.photos.new(photo_params)
        if photo_params[:is_active] == '有効'
            @photo.is_active = true
        elsif photo_params[:is_active] == '無効'
            @photo.is_active = false
        end

        if @photo.save
            redirect_to root_path
            # redirect_to users_photo_path(@photo.id)
        else
            render new_public_photo_path
        end
    end
    def show
        @photo = Photo.find(params[:id])
        @cart_item = CartItem.new
        @user = User.find_by(id: @photo.user_id)
        @like = Like.new
    end
    def edit
        @photo = Photo.find(params[:id])
        @user = User.find_by(id: @photo.user_id)
    end
    def update
        @photo = Photo.find(params[:id])
        if @photo.update(photo_params)
            redirect_to public_photo_path(@photo)
          else
            render "index"
          end
    end
    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy
       redirect_to public_photos_path
    end
    private
        def photo_params
            params.require(:photo).permit(:title, :gallary_id , :image, :caption, :price, :is_active)
        end

end
