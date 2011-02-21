class ApplicationController < ActionController::Base
  include BreadcrumbsOnRails::ControllerMixin
  protect_from_forgery

  def after_sign_in_path_for(resource_or_scope)
    app_profiles_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end
end
