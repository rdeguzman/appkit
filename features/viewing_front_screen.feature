Feature: View the Front Screen
  In order to view the main screen
  As a user
  I want to see the sections and background image

Background:
  Given I am on the new user session page
    And I am logged as a @user

Scenario: See Front Screen
  Given there is an application called "Test Hotel"
    And I am on the app_profiles page for "Test Hotel"
  When I follow "Test Hotel"
  Then I should see "Add New Section"
  Then I should see "Update Background"
