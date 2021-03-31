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

  #   def configure_permitted_parameters
  #       added_attrs = [ :email, :username, :password, :password_confirmation ]       
  #       devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #       devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  #       devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  #   end
  #   # usernameとpasswordでのログインを可能にする
  # end

end
