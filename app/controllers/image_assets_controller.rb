class ImageAssetsController < ApplicationController
  def new
    @app_profile = AppProfile.find(params[:app_profile_id])
    add_breadcrumb "#{@app_profile.app_name} App", app_profile_path(@app_profile)
  end

  def create
    #delete an existing asset if it exists
    user_id = current_user.id
    app_profile = AppProfile.find(params[:image_asset][:app_profile_id])
    current_asset = ImageAsset.where(:asset_type => params[:image_asset][:asset_type], :user_id => user_id, :app_profile_id => app_profile.id).first
    if !current_asset.nil?
      current_asset.destroy
    end

    #You can specify a sleep here to mimic a long response
    #sleep 5
    newparams = coerce(params)
    
    image_asset = ImageAsset.new(newparams[:image_asset])
    image_asset.user_id = user_id
    image_asset.app_profile_id = app_profile.id
    
    if image_asset.save
      flash[:notice] = "ImageAsset was successfully created"

      app_profile[params[:image_asset][:asset_type]] = image_asset.id
      app_profile.save
      
      respond_to do |format|
        format.html {redirect_to app_profile_path(app_profile)}
      end
    else
      flash[:alert] = "There is an error in saving the image_asset."
      respond_to do |format|
        format.html {redirect_to app_profile_path(app_profile)}
        #format.json {render :json => { :result => 'error', :error => flash[:alert] } }
      end
    end
  end

  private 
    def coerce(params)
      if params[:image_asset].nil? 
        h = Hash.new 
        h[:image_asset] = Hash.new 
        h[:image_asset][:image] = params[:Filedata]
        h[:image_asset][:image].content_type = MIME::Types.type_for(h[:image_asset] [:image].original_filename).to_s 
        h
      else 
        params
      end 
    end
end
