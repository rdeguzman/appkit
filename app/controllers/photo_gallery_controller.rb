class PhotoGalleryController < ApplicationController
  def index
    @app_profile = AppProfile.find(params[:app_profile_id])
    authorize_task_and_redirect?(@app_profile.user_id)

    @pictures = @app_profile.pictures

    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end
  
  def create
    # if this method is not called, please see config/routes and _uploadify
    @app_profile = AppProfile.find(params[:app_profile_id])
    newparams = coerce(params)
    
    current_pictures = Picture.where(:app_profile_id => params[:app_profile_id]).all
    
    @picture = Picture.new(newparams[:picture])
    @picture.user_id = current_user.id
    @picture.app_profile_id = params[:app_profile_id]
    
    if @picture.save!
      flash[:notice] = "Picture was successfully created"
      
      respond_to do |format|
        format.html {redirect_to photo_gallery_path(:app_profile_id => @app_profile.id)}
        
        if current_pictures.empty?
          format.json {render :json => {:result => 'success', :picture => url_for(:controller => 'photo_gallery', :action => 'show', :id => @picture.id, :first => 'true')}}
        else
          format.json {render :json => { :result => 'success', :picture => photo_gallery_show_path(:id => @picture.id) } }
        end
      end
    else
      flash[:alert] = "There is an error in saving the picture."
      respond_to do |format|
        format.html {redirect_to photo_gallery_path(:app_profile_id => @app_profile.id)}
        format.json {render :json => { :result => 'error', :error => flash[:alert] } }
      end
    end
  end

  def show
    @picture = Picture.find(params[:id])
    authorize_task_and_redirect?(@picture.user_id)

    @total_pictures = Picture.find(:all, :conditions => { :app_profile_id => @picture.app_profile_id})
   
    if params[:first]
      render :template => 'pictures/insert'
    else
      render :template => 'pictures/show'
    end
  end
  
  def edit
    @picture = Picture.find(params[:id])
    authorize_task_and_redirect?(@picture.user_id)
  end
  
  def update
    @picture = Picture.find(params[:id])
    authorize_task_and_redirect?(@picture.user_id)

    @picture.user_id = current_user.id
    
    if @picture.update_attributes(params[:picture])
      flash[:notice] = "Caption was successfully updated."
      redirect_to photo_gallery_path(:app_profile_id => @picture.app_profile_id)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    picture = Picture.find(params[:id])
    authorize_task_and_redirect?(picture.user_id)

    app_profile_id = picture.app_profile_id
    picture.destroy
    flash[:notice] = "Picture was successfully deleted"
    redirect_to photo_gallery_path(:app_profile_id => app_profile_id)
  end
    
  private 
    def coerce(params)
      if params[:picture].nil? 
        h = Hash.new 
        h[:picture] = Hash.new 
        h[:picture][:app_profile_id] = params[:app_profile_id] 
        h[:picture][:image] = params[:Filedata]
        h[:picture][:image].content_type = MIME::Types.type_for(h[:picture] [:image].original_filename).to_s 
        h
      else 
        params
      end 
    end

end
