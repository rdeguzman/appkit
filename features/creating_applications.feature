Feature: Creating a New App
  In order to create and manage app_profile
  As a user
  I want to create and validate an app

Background:
  Given I am on the new user session page
    And I am logged as a @user

Scenario: Create a new application
  When I am on the new app_profile page
   And I fill in "App name" with "Sample App"
   And I press "Create App profile"
  Then I should see "New application was successfully created"

Scenario: Create a new application without an app_name
  When I am on the new app_profile page
   And I press "Create App profile"
  Then I should see "App name can't be blank"

Scenario: Create a new application that already exists
  Given there is an application called "Sample App"
  When I am on the new app_profile page
   And I fill in "App name" with "Sample App"
   And I press "Create App profile"
  Then I should see "App name has already been taken"
