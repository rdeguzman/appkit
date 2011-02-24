Feature: Editing a section
  In order to edit a section
  As a user
  I want to see sections updated appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @user
    And there is an application called "Test Hotel"
    And there is a section called "Test Section 1"
    And I am on the app_profile page for "Test Hotel"
    #And show me the page

Scenario: Display Edit Section Form
  When I follow "Edit"
  Then I should see "Edit Section"
    And the "Title" field within "form" should contain "Test Section 1"
    And I should be on the edit section page for "Test Section 1"
    #And show me the page

Scenario: Updating a section without a title
  Given I follow "Edit"
  When I fill in "Title" with ""
   And I press "Update Section"
  Then I should see "error found"
    And I should see "Title can't be blank"
    #And show me the page

Scenario: Updating a section with a title
  Given I follow "Edit"
  When I press "Update Section"
  Then I should see "Section was successfully updated"
