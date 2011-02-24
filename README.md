== Welcome to AppKit

A solution for mobile app development and deployment strategy focused on the travel industry.

== Testing


1. Test values should always be "Test [entity value]". For example

  Test Hotel

We use cucumber, capybara and factory_girl.

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



