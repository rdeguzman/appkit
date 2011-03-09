class PagesController < ApplicationController
  load_and_authorize_resource

  def new
    @page = Page.new
    @section = Section.find(params[:section_id])
    @app_profile = @section.app_profile

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@section.title} List", section_path(@section)
  end
  
  def create
    @page = Page.create(params[:page])
    @section = @page.section
    
    if @page.save
      redirect_to page_path(@page), :notice => "Page was successfully created"
    else
      @section = Section.find(@page.section_id)
      @app_profile = @section.app_profile
      add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
      add_breadcrumb "#{@section.title} List", section_path(@section)

      render :action => "new"
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @section = @page.section
    @app_profile = @section.app_profile

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@section.title} List", section_path(@section)
    add_breadcrumb "#{@page.title}", page_path(@page)
  end
  
  def update
    @page = Page.find(params[:id])
    @section = @page.section

    if @page.update_attributes(params[:page])
      flash[:notice] = "Page was successfully updated."
      redirect_to page_path(@page)
    else
      @section = Section.find(@page.section_id)
      @app_profile = @section.app_profile
      add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
      add_breadcrumb "#{@section.title} List", section_path(@section)

      render :action => 'edit'
    end
  end

  def destroy
    page = Page.find(params[:id])
    section = page.section
    page.destroy
    flash[:notice] = "Page was successfully deleted"
    redirect_to section_path(section)
  end

  def show
    @page = Page.find(params[:id])
    @section = @page.section
    @app_profile = @section.app_profile
    @pictures = @page.pictures
    @back_path = section_path(@section)

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
    add_breadcrumb "#{@section.title} List", section_path(@section)
    add_breadcrumb "#{@page.title}", page_path(@page)
  end
end
