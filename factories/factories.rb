user = User.find(1)

Factory.define :app_profile do |_app_profile|
  _app_profile.id 1
  _app_profile.app_name 'Test Hotel'
  _app_profile.user_id user.id
end

Factory.define :section do |f|
  f.app_profile_id 1
  f.title 'Test Section 1'
  f.user_id user.id
end

#Factory.define :section do |f|
#  f.association :app_profile, :factory => :app_profile
#  f.title 'Test Section 1'
#  f.user_id user.id
#end

#Factory.define :section do |f|
#  #f.association :app_profile, :factory => :app_profile
#  app_profile = AppProfile.find_by_app_name("Test Hotel")
#  f.app_profile_id = app_profile.id
#  f.title 'Test Section 1'
#  f.user_id user.id
#end

#this will create a new section everytime
#Factory.define :section do |f|
#  app_profile = AppProfile.where(:app_name => "Test Hotel")
#  if app_profile.empty?
#    f.association :app_profile, :factory => :app_profile
#  else
#    f.app_profile_id = app_profile.id
#  end
#
#  f.title 'Test Section 1'
#  f.user_id user.id
#end

#Factory.sequence(:section_title){
#  |n| "Test Section #{n}"
#}

#Factory.define :section do |_section|
#  _section.title { Factory.next(:section_title) }
#  _section.user_id user.id
#  _section.association :app_profile 
#end
