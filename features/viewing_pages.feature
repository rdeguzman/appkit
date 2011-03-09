Feature: Viewing a page
  In order to view a page
  As a user
  I want to see page action links appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And there is a section called "Test Section 1"
    And there is a page called "Test Page 1"

Scenario: Display Single Page 
  Given I am on the detail page for "Test Page 1"
  When I follow "Edit"
  Then I should see "Edit Page"
    And I should see "Test Section 1 List"
    #And show me the page
