Feature: Viewing application summary
  In order to see an application summary
  As a user
  I want to see the application build appropriately

Scenario: Display application summary
  Given I am on the new user session page
    And I am logged as a @normal
  Given there is an application called "Test Hotel"
    And I am on the app_profile summary page for "Test Hotel"
  Then I should not see "Add New Build"

Scenario: Display application summary for shangrila_owner
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profile summary page for "Shangrila"
  Then I should see "Add New Build"

Scenario: Display application summary
  Given I am on the new user session page
    And I am logged as a @admin
    And I am on the app_profile summary page for "Shangrila"
  Then show me the page
  Then I should not see "Add New Build"
