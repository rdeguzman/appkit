class PicturesController < ApplicationController
  def index
    @page = Page.find(params[:page_id])
    @pictures = @page.pictures
    section = @page.section
    app_profile = section.app_profile
    
    add_breadcrumb "#{app_profile.app_name} App", app_profile_path(app_profile)
    add_breadcrumb "#{section.title} List", section_path(section)
    add_breadcrumb "#{@page.title}", page_path(@page)
  end
  
  def create
    #You can specify a sleep here to mimic a long response
    #sleep 5
    newparams = coerce(params)
    
    #current_pictures = Picture.find(:all, :conditions => { :page_id => params[:page_id]})
    current_pictures = Picture.where(:page_id => params[:page_id]).all
    
    @picture = Picture.new(newparams[:picture])
    @picture.user_id = current_user.id
    
    if @picture.save
      flash[:notice] = "Picture was successfully created"
      
      respond_to do |format|
        format.html {redirect_to pictures_path(:page_id => @picture.page_id)}
        
        if current_pictures.empty?
          format.json {render :json => {:result => 'success', :picture => url_for(:controller => 'pictures', :action => 'show', :id => @picture.id, :first => 'true')}}
        else
          format.json {render :json => { :result => 'success', :picture => picture_path(@picture) } }
        end
      end
    else
      flash[:alert] = "There is an error in saving the picture."
      respond_to do |format|
        format.html {redirect_to pictures_path(:page_id => @picture.page_id)}
        format.json {render :json => { :result => 'error', :error => flash[:alert] } }
      end
    end
  end

  def show
    @picture = Picture.find(params[:id], :include => :page)
    @total_pictures = Picture.find(:all, :conditions => { :page_id => @picture.page.id})
   
    if params[:first]
      render :template => 'pictures/insert'
    else
      render :template => 'pictures/show'
    end
  end
  
  def edit
    @picture = Picture.find(params[:id])
  end
  
  def update
    @picture = Picture.find(params[:id])
    @picture.user_id = current_user.id
    
    if @picture.update_attributes(params[:picture])
      flash[:notice] = "Caption was successfully updated."
      redirect_to pictures_path(:page_id => @picture.page.id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    picture = Picture.find(params[:id])
    page_id = picture.page_id
    picture.destroy
    flash[:notice] = "Picture was successfully deleted"
    redirect_to pictures_path(:page_id => page_id)
  end
    
  private 
    def coerce(params)
      if params[:picture].nil? 
        h = Hash.new 
        h[:picture] = Hash.new 
        h[:picture][:page_id] = params[:page_id] 
        h[:picture][:image] = params[:Filedata]
        h[:picture][:image].content_type = MIME::Types.type_for(h[:picture] [:image].original_filename).to_s 
        h
      else 
        params
      end 
    end

end
