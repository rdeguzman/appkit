require 'spec_helper'
include AppExporter

describe AppExportController do

  app_profile = AppProfile.find_by_app_name("Shangrila")
  src_db_path = File.expand_path(Rails.root.to_s) + "/db/exported_app.db"
  dest_path = "/wwwroot/images/appkit/exported"
  dest_db_path = dest_path + "/#{app_profile.app_name}.db"

  it "removes a database on /wwwroot/images/appkit/exported if it exists" do
    FileUtils.touch dest_db_path
    removeArchive(app_profile)
    File.exists?(dest_db_path).should == false
  end

  it "copies a database to /wwwroot/images/appkit/exported from ../db/exported_app.db" do
    File.exists?(src_db_path).should == true

    createDatabaseArchive(app_profile)

    File.exists?(dest_db_path).should == true
  end

  it "populates the sections" do
    db = SQLite3::Database.open( dest_db_path )
    actual_count = populateSections(app_profile)
    expected_count = db.get_first_value( "SELECT count(*) FROM sections" )
    db.close
  
    actual_count.should == expected_count 
  end

  it "populates the pages" do
    db = SQLite3::Database.open( dest_db_path )
    actual_count = populatePages(app_profile)
    expected_count = db.get_first_value( "SELECT count(*) FROM pages" )
    db.close

    actual_count.should == expected_count 
  end

  it "populates the pictures" do
    db = SQLite3::Database.open( dest_db_path )
    actual_count = populatePictures(app_profile)
    expected_count = db.get_first_value( "SELECT count(*) FROM pictures" )
    db.close

    actual_count.should == expected_count 
  end

  it "create an archive" do
    createArchive(app_profile)
    zip_file = zip_file_path(app_profile.app_name)
    File.exists?(zip_file).should == true
  end

  it "cleanup unnecessary files" do
    cleanup(app_profile)

    zip_file = zip_file_path(app_profile.app_name)
    File.exists?(zip_file).should == true
    File.exists?(dest_db_path(app_profile.app_name)).should == false
    File.exists?(dest_image_dir_path(app_profile.app_name)).should == false
  end

end
