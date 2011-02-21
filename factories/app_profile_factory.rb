@user = User.find(1)

Factory.define :app_profile do |app_profile|
  app_profile.app_name 'RobMarleys Hotel'
  app_profile.user_id @user.id
end
