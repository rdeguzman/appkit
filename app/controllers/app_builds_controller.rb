class AppBuildsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @app_profile = AppProfile.find(params[:app_profile_id])

    @app_build = AppBuild.new
    @app_build.product_name = @app_profile.itunes_product_name
    @app_build.binary_name = @app_profile.binary_name
    @app_build.version_number = @app_profile.version_number
    @app_build.build_request_name = create_build_request_name(@app_profile)
  end

  def create
    @app_build = AppBuild.create(params[:app_build])
    @app_build.user_id = current_user.id

    @app_profile = AppProfile.find(params[:app_build][:app_profile_id])
    @app_build.build_status = "Request to Build"

    if @app_build.save
      redirect_to app_profile_summary_path(@app_profile), :notice => "New application build was successfully created"
    else
      render :action => "new"
    end
  end

  def edit
    @app_build = AppBuild.find(params[:id])
    @app_profile = @app_build.app_profile
  end

  def update
    @app_build = AppBuild.find(params[:id])
    @app_profile = @app_build.app_profile

    if @app_build.update_attributes(params[:app_build])
      flash[:notice] = "App Build was successfully updated."
      redirect_to app_profile_summary_path(@app_profile)
    else
      render :action => 'edit'
    end
  end

  private
    def create_build_request_name(app_profile)
      t = Time.now
      strDate = t.strftime("%Y-%m-%d")
      "#{app_profile.binary_name}-#{strDate}-#{app_profile.version_number}"
      
    end

end
