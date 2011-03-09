Given /^I am logged as a @(\w+)$/ do |role|
  if role == 'normal'
    fill_in("user_email", :with => "demo@2rmobile.com")
    fill_in("user_password", :with => "password")
    click_button("Login")
  else role == 'admin'
    fill_in("user_email", :with => "rndguzmanjr@gmail.com")
    fill_in("user_password", :with => "password")
    click_button("Login")
  end
end
