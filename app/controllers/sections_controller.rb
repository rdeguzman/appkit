class SectionsController < ApplicationController
  load_and_authorize_resource

  def new
    @section = Section.new(:app_profile_id => params[:app_profile_id])
    @app_profile = @section.app_profile

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end
  
  def create
    @section = Section.create(params[:section])
    @section.user_id = current_user.id
    
    if @section.save
      redirect_to app_profile_path(@section.app_profile), :notice => "Section was successfully created"
    else

      @app_profile = @section.app_profile
      add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)

      render :action => "new"
    end
    
  end
  
  def show
    @section = Section.find(params[:id])
    @app_profile = @section.app_profile
    @pages = @section.pages
  
    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@section.title} List", section_path(@section)
  end
  
  def edit
    @section = Section.find(params[:id])
    @app_profile = @section.app_profile
  end
  
  def update
    @section = Section.find(params[:id])
    @app_profile = @section.app_profile

    if @section.update_attributes(params[:section])
      flash[:notice] = "Section was successfully updated."
      redirect_to app_profile_path(@section.app_profile)
    else
      render :action => 'edit'
    end
  end

  def destroy
    section = Section.find(params[:id])
    app_profile = section.app_profile
    if section.pages.count == 0
      section.destroy
      flash[:notice] = "Section was successfully deleted"
      redirect_to app_profile_path(app_profile)
    else
      flash[:alert] = "You cannot delete a section if it has one or more pages. Delete the pages first before deleting the section."
      redirect_to app_profile_path(app_profile)
    end 
  end
end
