class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!
  

  def after_sign_in_path_for(resource)
      flash[:notice] = 'Signed in successfully.'
      user_path(current_user)
    end
    def after_sign_out_path_for(resource)
      flash[:notice] = 'Signed out successfully.'
      root_path
    end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

    added_attrs = [ :email, :username, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end