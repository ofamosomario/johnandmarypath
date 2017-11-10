class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def user_not_authorized
    flash[:alert] = "Você não está autorizado a acessar isso."
    redirect_to(request.referrer || root_path)
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, 
      :password, :password_confirmation, :full_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, 
      :password_confirmation, :full_name])
  end  

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
