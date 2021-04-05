class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(resouse)
    @user
  end
  # ログイン後の遷移先
  

  
  protected
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
        end
    end

  private
  
    def logged_in_user
      unless user_signed_in?
        store_location
        flash[:dander] = "Please log in."
        redirect_to new_user_session_url
      end
    end
    # ログインしていなければ
    # ログイン前にいたページを維持する
    # メッセージを表示して、ログインページに流す
    
end
