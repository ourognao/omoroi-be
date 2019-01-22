class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery
  before_action :set_locale
  before_action :skip_session
  # before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def skip_session
    request.session_options[:skip] = true
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
