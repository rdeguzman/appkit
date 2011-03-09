class Admin::HomeController < Admin::ApplicationController

  def index
    @users = User.all
    @app_profiles = AppProfile.all
  end

end
