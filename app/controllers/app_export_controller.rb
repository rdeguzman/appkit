class AppExportController < ApplicationController

  include AppExporter

  def show
    app_profile = AppProfile.find(params[:id])

    removeArchive(app_profile)
    createDatabaseArchive(app_profile)
    populateSections(app_profile) 
    populatePages(app_profile) 
    populatePictures(app_profile) 
    createArchive(app_profile)
    cleanup(app_profile)

    @zip_file = "#{app_profile.app_name}.tar.gz"
    @zip_path = download_path(app_profile.app_name)

    flash[:notice] = "Database archive successfully created."
  end
end
