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
        # @Photoss = Photo.search(params[:search])
        @hashtag = Hashtag.find_by(hashname: params[:tag])
        @hashtag_photos = @hashtag.photos if @hashtag.present?
        # @hashtag_photos = HashtagPhoto.where(hashtag_id: @hashtag.id)
        # @hashtag_photos = HashtagPhoto.search(params[:search])
    end
    def new
        @photo = Photo.new
        @gallaries = Gallary.all
        @tag_list = Tag.all 
    end
    def create
        @photo = current_user.photos.new(photo_params)
        # tag_list = params[:photo][:tag_name].split(nil)
        # if @photo.save
        #     @photo.save_tag(tag_list)
        #     redirect_back(fallback_location: root_path)
        # else
        #     redirect_back(fallback_location: root_path)
        # end

        if photo_params[:is_active] == '有効'
            @photo.is_active = true
        elsif photo_params[:is_active] == '無効'
            @photo.is_active = false
        end

        if @photo.save
            redirect_to public_photo_path(@photo.id)
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
        # @photo_tags = @photo.tags
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
    def hashtag
        # @q = Hashtag.find(hashname: params[@q])
        #  binding.pry
        @hashname =  params[:hashname_cont]
        # @hashtag = Hashtag.find_by(hashname: @hashname)
        @hashtags = Hashtag.where(['hashname LIKE ?', "%#{params[:hashname_cont]}%"])
        hashtag_photo_ids = []
        @hashtags.each do |hashtag|
            # binding.pry
            hashtag.hashtag_photos.each do |hashtag_photo|
                hashtag_photo_ids << hashtag_photo.id
            # binding.pry
            end
        end
        # @hashtag_photos = if @hashtag.present?
            #   @photo = @hashtag.photo.page(params[:page]).per(20).reverse_order
        #  binding.pry
        if @hashname == ""
            @hashtag_photos =  []
            @hashtag_photos_count = 0
        else
            @hashtag_photos = HashtagPhoto.where(id: hashtag_photo_ids.uniq)
            @hashtag_photos_count = @hashtag_photos.count
        end
        # else
        # end
        # binding.pry
        # @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.photos.count}
      end
      def search
        #Viewのformで取得したパラメータをモデルに渡す
        @Photoss = Photo.search(params[:search])
      end

    private
        def photo_params
            params.require(:photo).permit(:title, :gallary_id , :image, :caption, :price,:hashbody, :is_active, hashtag_ids:[])
        end
end
