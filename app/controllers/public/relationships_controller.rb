class Public::RelationshipsController < ApplicationController
    def create
        @user = User.find(params[:relationship][:following_id])
        current_user.follow!(@user)
        redirect_to public_photos_path
      end
      def destroy
        @user = Relationship.find(params[:id]).following
        current_user.unfollow!(@user)
        redirect_to public_photos_path
      end
end
