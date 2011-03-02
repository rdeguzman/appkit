require 'sqlite3'

module AppExporter

  def src_db_path
    File.expand_path(Rails.root.to_s) + "/db/exported_app.db"
  end

  def dest_path
    "/wwwroot/images/appkit/exported"
  end

  def dest_image_path(app_name, filename)
    dest_image_dir_path(app_name) + filename
  end

  def dest_image_dir_path(app_name)
    "/wwwroot/images/appkit/exported/#{app_name}/"
  end

  def dest_db_path(filename)
    dest_path + "/#{filename}.db"
  end

  def zip_file_path(filename)
    dest_path + "/#{filename}.tar.gz"
  end

  def download_path(filename)
    "/images/appkit/exported/#{filename}.tar.gz"
  end

  def removeArchive(app_profile)
    file_path = dest_db_path(app_profile.app_name)
    if File.exists?(file_path)
      FileUtils.remove file_path
    end
  end

  def createDatabaseArchive(app_profile)
    if File.exists?(src_db_path)
      FileUtils.cp(src_db_path, dest_db_path(app_profile.app_name) )
    end
  end

  def populateSections(app_profile)
    db = SQLite3::Database.open( dest_db_path(app_profile.app_name) )
    sections = app_profile.sections
    sections.each do |section|
      db.execute( "INSERT INTO sections(id, title) VALUES(?, ?)", section.id, section.title)
    end
    db.close

    return sections.size
  end

  def populatePages(app_profile)
    total = 0

    db = SQLite3::Database.open( dest_db_path(app_profile.app_name) )
    sections = app_profile.sections
    sections.each do |section|

      pages = section.pages

      pages.each do |page|
        db.execute( "INSERT INTO pages(id, title, sub_title, content, section_id) VALUES(?, ?, ?, ?, ?)", page.id, page.title, page.sub_title, page.content, page.section_id)
        total = total + 1
      end

    end

    db.close

    return total
  end

  def getData(image_path)
    file = File.open(image_path)
    data = file.read
    data
  end

  def populatePictures(app_profile)
    total = 0

    if File.exists?(dest_image_dir_path(app_profile.app_name))
      FileUtils.remove_dir dest_image_dir_path(app_profile.app_name)
    end

    FileUtils.mkdir(dest_image_dir_path(app_profile.app_name))

    db = SQLite3::Database.open( dest_db_path(app_profile.app_name) )
    sections = app_profile.sections
    sections.each do |section|

      pages = section.pages

      pages.each do |page|

        pictures = page.pictures

        pictures.each do |picture|

          thumb_image_path = "/wwwroot/images/appkit/#{picture.id}/thumb/#{picture.image_file_name}"
          full_image_path = "/wwwroot/images/appkit/#{picture.id}/pagesize/#{picture.image_file_name}"

          FileUtils.cp(thumb_image_path, dest_image_path(app_profile.app_name, "thumb_#{picture.image_file_name}"))
          FileUtils.cp(full_image_path, dest_image_path(app_profile.app_name, "full_#{picture.image_file_name}"))

          thumb_data = getData(thumb_image_path)
          full_data = getData(full_image_path)

          db.execute( "INSERT INTO pictures(id, caption_title, caption_description, page_id, full_image_file_name, thumb_image_file_name, full_image, thumb_image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", picture.id, picture.caption_title, picture.caption_description, picture.page_id, picture.image_file_name, picture.image_file_name, SQLite3::Blob.new(full_data), SQLite3::Blob.new(thumb_data) )
          total = total + 1

        end
        
      end

    end

    db.close

    return total
  end

  def createArchive(app_profile)
    zip_file = zip_file_path(app_profile.app_name)
    if File.exists?(zip_file)
      FileUtils.remove zip_file
    end

    script_file = File.expand_path(Rails.root.to_s) + "/lib/package.sh"
    system("sh #{script_file} #{app_profile.app_name}")
  end

  def cleanup(app_profile)
    dest_db_file = dest_db_path(app_profile.app_name)
    if File.exists?(dest_db_file)
      FileUtils.remove dest_db_file
    end
    
    dir_images_path = dest_image_dir_path(app_profile.app_name)
    if File.exists?(dir_images_path)
      FileUtils.remove_dir dir_images_path
    end
  end

end
