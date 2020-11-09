class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_hashtag_search
    def set_search
      @search = User.ransack(params[:q])
      @users = @search.result
    end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number,:email,:nickname])
    end

    def set_hashtag_search
      # 検索オブジェクト
      @q = Hashtag.ransack(params[:q])
      # 検索結果
      @hashtags = @q.result
      # if @hashtags.present?
      #   redirect_to hoge_path(hashname: params[:q])
      # end
    end
end
