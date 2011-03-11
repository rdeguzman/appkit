class Admin::HomeController < Admin::ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @app_profiles = AppProfile.all
    @app_builds = AppBuild.all
  end

end
