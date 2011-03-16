# Welcome to AppKit

A solution for mobile app development and deployment strategy (currently focused in the travel industry).

1. SignUp
1. Create an application profile
1. Update/Upload content and images
1. Export the App
1. Download the App Archive

## Deployment Notes

1. login as rupert
    rvm use 1.8.7
    bundle install
    sudo /etc/init.d/apache2 restart
    cp -Rf path_to/secure/config/database.yml config/database.yml

2. Paths that need to exist 
    /wwwroot/images/appkit/exported
    /wwwroot/images/appkit/pictures
    /wwwroot/images/appkit/image_assets

    drwxr-xr-x  2 rupert   rupert 4096 Mar  4 22:12 exported
    drwxr-xr-x  7 rupert   rupert 4096 Mar  5 04:02 image_assets
    drwxr-xr-x 33 rupert   rupert 4096 Mar  5 04:29 pictures

## Testing steps during Development
    export RAILS_ENV=test
    rake db:reset
    rake db:data:load
    cucumber
    rspec spec/*

Note: rake cucumber does not load the data using rake db:data:load. See lib/tasks/cucumber.rake

## Testing using cucumber, capybara and factory_girl

1. Create a scenario in cucumber

  Scenario: See Front Screen
    Given there is an application called "Test Hotel"
      And I am on the app_profiles page
    When I follow "Test Hotel"
    Then I should see "Add New Section"
    Then I should see "Update Background"

2. Build and save an 'application' or app_profile model instance using factory_girl (features/step_definitions/seed_steps.rb)

  Given /^there is an application called ""$/ do |name|
    Factory(:app_profile, :app_name => name)
  end

3. Define your app_profile factory in  factories/factories.rb

  @user = User.find(1)

  Factory.define :app_profile do |app_profile|
    app_profile.app_name 'Test Hotel'
    app_profile.user_id @user.id
  end

We now have an instance of app_profile.


## Migration Notes

1. March 09, 2011. Added app_profile_id and user_id to pages. Run the sql statement below. 

  UPDATE pages p, sections s
  SET p.app_profile_id = s.app_profile_id,
    p.user_id = s.user_id
  WHERE 
    s.id = p.section_id;

2. March 16, 2011. Add app_profile_id to pictures. Run the sql statement below

  UPDATE pictures ps, pages pg 
  SET ps.app_profile_id = pg.app_profile_id 
  WHERE ps.page_id = pg.id;
