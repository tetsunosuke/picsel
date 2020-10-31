class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    def top
        @photos = Photo.all
    end
    def my_page
        @user = current_user
    end
    def update
        @user = User.where(id: current_user.id)
        if @user.update(user_params)
            redirect_to  public_user_my_page_path
        else
          render root_path
        end
    end
    def edit 
        @user = current_user
    end

    private
    def user_params
      params.require(:user).permit(:last_name,:first_name,:first_name_kana,:last_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted,:rate,:profile_image,:introduce)
    end

end
