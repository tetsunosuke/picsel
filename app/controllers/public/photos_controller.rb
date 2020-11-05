class Public::PhotosController < ApplicationController
    before_action :authenticate_user!
    def index
        # binding/pry
        @tag_list = Tag.all  
        if params[:user_id].nil?
            @user = current_user
            # @photos = Photo.where(user_id: current_user.id)
        else
            # binding.pry
            @user = User.find(params[:user_id])
            
        end
        @photos = Photo.where(user_id: @user.id)
        #  binding.pry


    end
    def new
        @photo = Photo.new
        @gallaries = Gallary.all
        @tag_list = Tag.all 
    end
    def create
        @photo = current_user.photos.new(photo_params)
        tag_list = params[:photo][:tag_name].split(nil)
        if @photo.save
            @photo.save_tag(tag_list)
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end

        if photo_params[:is_active] == '有効'
            @photo.is_active = true
        elsif photo_params[:is_active] == '無効'
            @photo.is_active = false
        end

        # if @photo.save
        #     redirect_to root_path
        #     # redirect_to users_photo_path(@photo.id)
        # else
        #     render new_public_photo_path
        # end
    end
    def show
        @photo = Photo.find(params[:id])
        @cart_item = CartItem.new
        @user = User.find_by(id: @photo.user_id)
        @like = Like.new
        @photo_tags = @photo.tags
        # @tag = Tag.find_by(id:@photo.tag_id)
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
    def search
        @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
        @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
        @photos = @tag.photos.all           
    end
    private
        def photo_params
            params.require(:photo).permit(:title, :gallary_id , :image, :caption, :price, :is_active)
        end

end
