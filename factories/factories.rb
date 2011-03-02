user = User.find_by_email!("demo@2rmobile.com")

Factory.define :app_profile do |_app_profile|
  _app_profile.id 100
  _app_profile.app_name 'Test Hotel'
  _app_profile.user_id user.id
end

Factory.define :section do |f|
  f.association :app_profile
  f.title 'Test Section 1'
  f.user_id user.id
end

Factory.define :page do |f|
  f.title 'Test Page 1'
  f.content 'Test Content'
  f.association :section
end
