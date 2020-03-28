class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    att_create = %i[full_name username email password password_confirmation]
    att_update = %i[cover_img profile_img full_name username email password current_password]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(att_create) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(att_update) }
  end
end
