Feature: Viewing applications
  In order to assign sections to an application
  As a user
  I want to see a list of applications

Background:
  Given I am on the new user session page
    And I am logged as a @user

Scenario: Listing all applications
  Given there is an application called "RobMarleys Hotel"
    And I am on the app_profiles page
  When I follow "RobMarleys Hotel"
    Then I should be on the app_profile page for "RobMarleys Hotel"
