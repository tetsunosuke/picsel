class Public::UsersController < ApplicationController
    before_action :authenticate_user!, except: [:top,:about]
    before_action :set_search
    def top
        # ランキング表示
        # photo_like_count = Photo.joins(:likes).group(:photo_id).count
        # photo_liked_ids = Hash[photo_like_count.sort_by{ |_, v| -v }].keys
        # @photos = Photo.where(id: photo_liked_ids)
        @photos = Photo.joins(:likes).group(:photo_id).order(Arel.sql('count(likes.id) DESC')).limit(50)
        #@photos = Photo.all
        # SELECT
        #   "photos".*
        # FROM
        #    "photos"
        # INNER JOIN
        #   "likes"
        # ON "likes"."photo_id" = "photos"."id"
        # GROUP BY "photo_id"
        # ORDER BY count(likes.id) DESC
    end
    def my_page
        @user = current_user
        # binding.pry
        # @order_detail = OrderDetail.where(photo_id: @user.photos.ids).pluck(:order_detail_id)
    end
    def update
        @user = User.where(id: current_user.id)
        if @user.update(user_params)
            redirect_to  my_page_public_users_path
        else
          render root_path
        end
    end
    def edit
        @user = current_user
        # @order_detail = OrderDetail.where(photo_id: @user.photos.ids).pluck(:order_detail_id)
    end
    def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render 'show_follow'
    end
  
    def followers
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follower'
    end

    private
    def user_params
      params.require(:user).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted,:rate,:profile_image,:introduce,:nickname)
    end

end
