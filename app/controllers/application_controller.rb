class ApplicationController < ActionController::Base
  before_action :configure_permit, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permit
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
  end

end
