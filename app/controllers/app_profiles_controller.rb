class AppProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @app_profiles = AppProfile.where(:user_id => current_user.id)
  end

  def new
    @app_profile = AppProfile.new
  end

  def create
    @app_profile = AppProfile.create(params[:app_profile])
    @app_profile.user_id = current_user.id
    
    if @app_profile.save
      redirect_to app_profiles_path, :notice => "New app was successfully created"
    else
      render :action => "new"
    end
  end

  def show
    @app_profile = AppProfile.find(params[:id])
    @sections = @app_profile.sections

    @image_asset_background_front = ImageAsset.find_by_id(@app_profile.background_front)

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end
end
