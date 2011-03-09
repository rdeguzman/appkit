class ButtonsController < ApplicationController
  def index
    @app_profile = AppProfile.find(params[:app_profile_id])
    @sections = @app_profile.sections 
    @single_pages = Page.where(:app_profile_id => @app_profile.id).where(:section_id => nil).all

    @buttons = Button.where(:app_profile_id => params[:app_profile_id])

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end

  def add
    buttons = Button.where(:app_profile_id => params[:app_profile_id])
    index = buttons.size + 1

    buttons_exists = Button.where(:title => params[:title], :table_name => params[:table_name], :parent_id => params[:parent_id], :app_profile_id => params[:app_profile_id]).all

    if buttons_exists.empty?

      button = Button.create(:index => index, :title => params[:title], :table_name => params[:table_name], :parent_id => params[:parent_id], :app_profile_id => params[:app_profile_id])

      if button.save
        flash[:notice] = "Button was successfully added."
        redirect_to buttons_path(:app_profile_id => params[:app_profile_id])
      else
        flash[:alert] = "There is a problem adding the button."
        redirect_to buttons_path(:app_profile_id => params[:app_profile_id])
      end
    else
        flash[:alert] = "The button already exists."
        redirect_to buttons_path(:app_profile_id => params[:app_profile_id])
    end
  end

  def delete_all
    buttons = Button.delete_all(:app_profile_id => params[:app_profile_id])
    flash[:notice] = "Buttons was successfully deleted."
    redirect_to buttons_path(:app_profile_id => params[:app_profile_id])
  end
end
