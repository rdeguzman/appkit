Given /^I am logged as a @(\w+)$/ do |role|
  if role == 'user'
    fill_in("user_email", :with => "rupert@2rmobile.com")
    fill_in("user_password", :with => "password")
    click_button("Login")
  end
end
