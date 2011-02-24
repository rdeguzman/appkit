Given /^there is an application called "([^"]*)"$/ do |name|
  @current_app_profile = Factory(:app_profile, :app_name => name)
end

Given /^there is a section called "([^"]*)"$/ do |name|
  @current_section = Factory(:section, :title => name, :app_profile_id => @current_app_profile.id)
end

Given /^there is a page called "([^"]*)"$/ do |name|
  Factory(:page, :title => name, :section_id => @current_section.id)
end
