class AppProfilesController < ApplicationController
  before_filter :authenticate_user!, :except => 'show'

  def index
    @app_profiles = AppProfile.where(:user_id => current_user.id)
  end

  def new
    @app_profile = AppProfile.new
  end

  def edit 
    @app_profile = AppProfile.find(params[:id])
    authorize_task_and_redirect?(@app_profile.user_id)
  end

  def update
    @app_profile = AppProfile.find(params[:id])
    authorize_task_and_redirect?(@app_profile.user_id)

    if @app_profile.update_attributes(params[:app_profile])
      flash[:notice] = "App Profile was successfully updated."
      redirect_to app_profile_summary_path(@app_profile)
    else
      render :action => 'edit'
    end
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

    @buttons = Button.where(:app_profile_id => @app_profile.id)

    @image_asset_background_front = ImageAsset.find_by_id(@app_profile.background_front)

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)

    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The application you are looking for could not be found."
      redirect_to root_path
  end

  def destroy
    app_profile = AppProfile.find(params[:id])
    authorize_task_and_redirect?(app_profile.user_id)

    app_profile.destroy

    flash[:notice] = "Application was successfully deleted"
    if admin_user?
      redirect_to admin_home_path
    elsif normal_user?
      redirect_to app_profiles_path
    end
  end

  def summary
    @app_profile = AppProfile.find(params[:id])
    authorize_task_and_redirect?(@app_profile.user_id)

    @app_build = @app_profile.app_builds.order(:updated_at).first
  end

  def image_assets
    @app_profile = AppProfile.find(params[:id])
    @image_asset_application_icon = @app_profile.application_icon
    @image_asset_application_artwork = @app_profile.application_artwork
  end

end
