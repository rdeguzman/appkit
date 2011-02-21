Given /^there is an application called "([^"]*)"$/ do |name|
  Factory(:app_profile, :app_name => name)
end
