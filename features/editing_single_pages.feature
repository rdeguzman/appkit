Feature: Editing a single page
  In order to edit a single page
  As a user
  I want to see single page updated appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And there is a single page called "Test Single Page 1"
    And there is a single page called "Test Single Page 2"
    And I am on the app_profile page for "Test Hotel"
    #And show me the page

Scenario: Display Edit Single Page
  When I follow "Edit"
  Then I should see "Edit Single Page"
    And the "Title" field within "form" should contain "Test Single Page 1"
    And the "Content" field within "form" should contain "Test Content"
    #And show me the page

Scenario: Updating a page with a title and content
  When I follow "Edit"
  And I fill in "Title" with "Test Single Page Updated"
    And I fill in "Content" with "Test Content Updated"
    And I press "Update Single page"
  Then I should see "Single Page was successfully updated"
    And I should be on the single_page page for "Test Single Page Updated"
    And I should see "Test Content Updated"
    And I should see "Edit"
    And I should see "Delete"
    #And show me the page

Scenario: Updating a page with an existing title 
  When I follow "Edit"
  And I fill in "Title" with "Test Single Page 2"
    And I fill in "Content" with "Test Content Updated"
    And I press "Update Single page"
  Then I should see "error found"
    And I should see "Title has already been taken"
    And I should be on the single_page page for "Test Single Page 1"
    #And show me the page
