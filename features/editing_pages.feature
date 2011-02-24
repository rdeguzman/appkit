Feature: Editing a page
  In order to edit a page
  As a user
  I want to see pages updated appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @user
    And there is an application called "Test Hotel"
    And there is a section called "Test Section 1"
    And there is a page called "Test Page 1"
    And I am on the section page for "Test Section 1"
    #And show me the page

Scenario: Display Edit Section Form
  When I follow "Edit"
  Then I should see "Edit Page"
    And the "Title" field within "form" should contain "Test Page 1"
    And the "Content" field within "form" should contain "Test Content"
    #And show me the page

Scenario: Updating a page with a title and content
  When I follow "Edit"
  When I fill in "Title" with "Test Page Updated"
    And I fill in "Content" with "Test Content Updated"
    And I press "Update Page"
  Then I should see "Page was successfully updated"
    And I should be on the detail page for "Test Page Updated"
    #And show me the page

Scenario: Updating a section without a title
  When I follow "Edit"
    And I fill in "Title" with ""
    And I fill in "Content" with ""
    And I press "Update Page"
  #Then show me the page
  Then I should see "errors found"
    And I should see "Title can't be blank"
    And I should see "Content can't be blank"

