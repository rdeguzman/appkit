Given /^I logged as an @(\w+)$/ do |role|
  if role == 'normal'
    fill_in("user_email", :with => "rupert@2rmobile.com")
    fill_in("user_password", :with => "password")
    click_button("Login")
  end
end
