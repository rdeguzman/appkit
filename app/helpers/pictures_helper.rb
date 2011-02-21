module PicturesHelper
  def simple_upload_form?
    if params[:simple] == nil
      return false
    else
      return true
    end
  end
  
  def link_to_picture(picture)
    link_to(
      image_tag( picture.image.url(:thumb), :size => '80x80', :border => 0 ),
      picture.image.url(:pagesize),
      {
        :class => "thumb",
        :title => "#{picture.image_file_name}",
        :name => "#{picture.image_file_name}",
        :rel => "nofollow"
      }
    )
  end
  
  def link_to_web_photo(photo)
    link_to(
      image_tag( photo.thumb_path, :size => '80x80', :border => 0 ),
      photo.full_path,
      {
        :class => "thumb",
        :title => "#{photo.thumb_path}",
        :name => "#{photo.thumb_path}",
        :rel => "nofollow"
      }
    )
  end
end
