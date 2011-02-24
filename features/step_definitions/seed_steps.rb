Given /^there is an application called "([^"]*)"$/ do |name|
  Factory(:app_profile, :app_name => name)
end

Given /^there is a section called "([^"]*)"$/ do |name|
  Factory(:section, :title => name)
end
