Feature: Creating a page
  In order to create a page
  As a user
  I want to see pages created appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And there is a section called "Test Section"
    And I am on the section page for "Test Section"

Scenario: Display New Page Form
  When I follow "Add Page" 
  #Then show me the page
  Then I should see "Add Page"
   And I should see "Title*"
   And I should see "Content*"

Scenario: Creating a new page without a title and content
  When I follow "Add Page" 
    And I fill in "Title" with ""
    And I fill in "Content" with ""
    And I press "Create Page"
  #Then show me the page
  Then I should see "errors found"
   And I should see "Title can't be blank"
   And I should see "Content can't be blank"

Scenario: Creating a new page with a title and content
  When I follow "Add Page" 
    And I fill in "Title" with "Test Page 1"
    And I fill in "Content" with "Test Content Lorem Ipsum"
    And I press "Create Page"
  Then I should see "Page was successfully created"
    #And show me the page
    And I should be on the detail page for "Test Page 1"
