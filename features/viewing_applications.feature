Feature: Viewing applications
  In order to assign sections to an application
  As a user
  I want to see a list of applications

Scenario: Listing all applications
  Given I am on the new user session page
    And I am logged as a @normal
  Given there is an application called "Test Hotel"
    And I am on the app_profiles page
  When I follow "Test Hotel"
    Then I should be on the app_profile page for "Test Hotel"

Scenario: Listing all applications
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profiles page
  Then I should see "View Summary"

Scenario: Listing all applications
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profiles page
  When I follow "View Summary"
  Then I should see "Application Build"
