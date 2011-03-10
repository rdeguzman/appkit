Feature: View the Front Screen
  In order to view the main screen
  As a user
  I want to see the sections and background image

Scenario: See Front Screen
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And I am on the app_profiles page
    #And show me the page
  When I follow "Test Hotel"
  Then I should see "Add New Section"
  Then I should see "Update Background"
  Then I should see "Add New Single Page"
  Then I should see "Arrange Buttons"

Scenario: See Front Screen for different user
  Given I am on the app_profile page for "Shangrila"
    #And show me the page
  Then I should not see "Add New Section"
  Then I should not see "Update Background"
  Then I should not see "Add New Single Page"
  Then I should not see "Arrange Buttons"

Scenario: See Front Screen for Shangrila user
  Given I am on the new user session page
    And I am logged as a @shangrila_owner
    And I am on the app_profile page for "Shangrila"
    And show me the page
  Then I should see "Add New Section"
  Then I should see "Update Background"
  Then I should see "Add New Single Page"
  Then I should see "Arrange Buttons"
