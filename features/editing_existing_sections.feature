Feature: Editing a section
  In order to edit a section
  As a user
  I want to see sections updated appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @user
    And there is an application called "Test Hotel"
    And there is a section called "Test Section 1"
    And there is a section called "Test Section 2"
    And I am on the app_profile page for "Test Hotel"
    #And show me the page

@focus
Scenario: Updating a section with an existing title
  Given I am on the edit section page for "Test Section 1"
  When I fill in "Title" with "Test Section 2"
    And I press "Update Section"
  Then I should see "Title has already been taken"
    #And show me the page
