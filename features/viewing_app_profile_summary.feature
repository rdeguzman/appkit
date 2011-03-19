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

Scenario: Display add new build if appropriate fields filled up
  Given I am on the new user session page
    And I am logged as a @normal
  Given there is an application called "Test Hotel"
    And I am on the app_profile summary page for "Test Hotel"
  When I follow "Edit Metadata"
   And I fill in "Itunes product name" with "Test Hotel"
   And I fill in "Binary name" with "Test Hotel"
   And I fill in "Version number" with "1.0"
   And I press "Update App profile"
  #Then show me the page
  Then I should see "App Profile was successfully updated"
   And I should see "Add New Build"

Scenario: Display application summary
  Given I am on the new user session page
    And I am logged as a @admin
    And I am on the app_profile summary page for "Shangrila"
  #Then show me the page
  Then I should not see "Add New Build"

Scenario: Display manage application icon
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profile summary page for "Shangrila"
  Then I should see "Manage Image Assets"

Scenario: Follow manage application icon
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profile summary page for "Shangrila"
  When I follow "Manage Image Assets"
  Then I should see "Application Icon"
    And I should see "Application Artwork"
