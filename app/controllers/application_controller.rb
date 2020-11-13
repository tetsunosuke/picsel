class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
      # byebug
      case resource
      when Admin
        # byebug
        top_admins_photos_path
      when User
        # byebug
        root_path
      end
    end
    def set_search
      @search = User.ransack(params[:q])
      @users = @search.result
    end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number,:email,:nickname])
    end

    # def set_hashtag_search
    #   # 検索オブジェクト
    #   # @q = Hashtag.ransack(params[:q])
    #   # @hashtags = @q.result
    #   @hashtags = HashTag.where(['hashname LIKE ?', "%#{params[:q]}%"])
    # end
end
