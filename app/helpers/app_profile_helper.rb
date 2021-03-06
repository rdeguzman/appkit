module AppProfileHelper
  def display_application_image_asset(_obj)
    if !_obj.nil?
      image_tag _obj
    else
      image_tag('icon_not_available.gif')
    end
  end

  def thumb_background_front(_obj)
    if !_obj.nil?
      image_tag @image_asset_background_front.image.url(:thumb)
    end
  end

  def css_background_front(_obj)
    if _obj.nil?
      "width: 320px; height: 460px; background: url('../images/default_bg.jpg')"  
    else
      "width: 320px; height: 460px; background: url('#{_obj.image.url(:default)}')"  
    end
  end

  def css_list_element(_page)
    if _page.nil?
      "width: 320px; height: 75px; background:"
    else
      "width: 320px; height: 75px; background: #{cycle('#97989b','#acadaf')}"
    end
  end

  def button_path(button)
    if button.table_name == 'Section'
      section_path(:id => button.parent_id)
    elsif button.table_name == 'Page'
      single_page_path(:id => button.parent_id)
    elsif button.table_name = 'Photos'
      photo_gallery_path(:app_profile_id => button.app_profile_id)
    end
  end

  def computeForButtonTop(button_array)
    button_height =  34
    padding_vertical = 5
    application_height = 480 

    totalHeight = 0

    button_array.each do |b|
      totalHeight = totalHeight + button_height + padding_vertical
    end

    (application_height - totalHeight)/2
  
  end

  def can_create_build?(app_profile)
    if admin_user? || ( has_value?(app_profile.itunes_product_name) && has_value?(app_profile.binary_name) && has_value?(app_profile.version_number) )
      true
    else
      false
    end
  end

  def download_ipa_path(_ipa)
    if _ipa.nil?
      ""
    else
      "http://www.2rmobile.com/builds/#{_ipa}"
    end
  end
end
