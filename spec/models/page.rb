require 'spec_helper'

describe Page do

  it "should save with a user_id and app_profile_id" do
    current_app_profile = Factory(:app_profile, :app_name => "Just Another App")
    current_section = Factory(:section, :title => "Just Another Section", :app_profile_id => current_app_profile.id)
    current_section.user_id = user.id
    page = Factory(:page, :title => "Just Another Page", :section_id => current_section.id)
    page.save!

    page.app_profile_id.should == current_app_profile.id
    page.user_id.should == current_section.user_id
  end

end
