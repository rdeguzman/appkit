class SinglePagesController < ApplicationController
  load_and_authorize_resource

  def new
    @page = SinglePage.new
    @app_profile = AppProfile.find(params[:app_profile_id])

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end
  
  def create
    @page = SinglePage.create(params[:single_page])
    @app_profile = AppProfile.find(params[:single_page][:app_profile_id])
    @page.user_id = @app_profile.user_id
    
    if @page.save
      redirect_to single_page_path(@page), :notice => "Single Page was successfully created"
    else
      add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
      render :action => "new"
    end
  end
  
  def edit
    @page = SinglePage.find(params[:id])
    @app_profile = @page.app_profile

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@page.title}", page_path(@page)
  end
  
  def update
    @page = Page.find(params[:id])
    @app_profile = @page.app_profile
    @page.user_id = @app_profile.user_id

    if @page.update_attributes(params[:single_page])
      flash[:notice] = "Single Page was successfully updated."
      redirect_to single_page_path(@page)
    else
      add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
      render :action => "edit"
    end
  end

  def destroy
    page = SinglePage.find(params[:id])
    app_profile = page.app_profile
    page.destroy
    flash[:notice] = "Single Page was successfully deleted"
    redirect_to app_profile_path(app_profile)
  end

  def show
    @page = SinglePage.find(params[:id])
    @app_profile = @page.app_profile
    @pictures = @page.pictures
    @back_path = app_profile_path(@app_profile)

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@page.title}", page_path(@page)
  end
end
