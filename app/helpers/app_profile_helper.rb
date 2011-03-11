module AppProfileHelper
  def thumb_background_front(_obj)
    if _obj.nil?
    else
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
    if admin_user? || (!app_profile.itunes_product_name.nil? && !app_profile.binary_name.nil? && !app_profile.version_number.nil?)
      true
    else
      false
    end
  end
end
