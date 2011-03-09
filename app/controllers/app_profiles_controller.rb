class AppProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => 'show'

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
      redirect_to app_profiles_path, :notice => "New application was successfully created"
    else
      render :action => "new"
    end
  end

  def show
    @app_profile = AppProfile.find(params[:id])

    @sections = @app_profile.sections

    @single_pages = Page.where(:app_profile_id => @app_profile.id).where(:section_id => nil).all

    @image_asset_background_front = ImageAsset.find_by_id(@app_profile.background_front)

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The application you are looking for could not be found."
      redirect_to root_path
  end
end
