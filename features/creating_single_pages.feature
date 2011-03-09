Feature: Creating a single page
  In order to create a single page for an app_profile
  As a user
  I want to see single pages created appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    #And show me the page

Scenario: Display New Single Page Form
  Given I am on the app_profile page for "Test Hotel"
  When I follow "Add New Single Page" 
  Then I should see "Add Single Page"
    And I should see "Title*"
    And I should see "Content*"
    And I should see "Test Hotel App"

Scenario: Creating a new page without a title and content
  Given I am on the app_profile page for "Test Hotel"
  When I follow "Add New Single Page" 
    And I fill in "Title" with ""
    And I fill in "Content" with ""
    And I press "Create Single page"
  Then I should see "errors found"
   And I should see "Title can't be blank"
   And I should see "Content can't be blank"

Scenario: Cancel should go to app_profile page
  Given I am on the app_profile page for "Test Hotel"
  When I follow "Add New Single Page" 
    And I follow "Test Hotel App"
  Then I should be on the app_profile page for "Test Hotel"

Scenario: Creating a new page with a title and content
  Given I am on the app_profile page for "Test Hotel"
  When I follow "Add New Single Page" 
    And I fill in "Title" with "Foo"
    And I fill in "Content" with "Foo"
    And I press "Create Single page"
  Then I should not see "errors found"
    And I should be on the single_page page for "Foo"
    And I should see "Single Page was successfully created"
    #And show me the page
