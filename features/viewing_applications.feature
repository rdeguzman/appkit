Feature: Viewing applications
  In order to assign sections to an application
  As a user
  I want to see a list of applications

Scenario: Listing all applications
  Given I am on the new user session page
    And I am logged as a @normal
  Given there is an application called "Test Hotel 1"
    And there is an application called "Test Hotel 2"
    And there is an application called "Test Hotel 3"
    And I am on the app_profiles page
  Then I should see "Test Hotel 1"
    And I should see "Test Hotel 2"
    And I should see "Test Hotel 3"
    #And show me the page
