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
end
