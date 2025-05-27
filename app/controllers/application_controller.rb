class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
  authorize_resource unless: :devise_controller?

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path
  # end
end
