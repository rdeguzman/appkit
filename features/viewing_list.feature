Feature: View a list of pages for a section
  In order to view a list of pages
  As a user
  I want to see pages listed appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And there is a section called "Test Section 1"

Scenario: Display a list of pages
  Given there is a page called "Test Page 1"
    And there is a page called "Test Page 2"
    And there is a page called "Test Page 3"
  When I am on the section page for "Test Section 1"
  Then I should see "Test Page 1"
   And I should see "Test Page 2"
   And I should see "Test Page 3"
   And I should see "Add Page"
   #And show me the page
  
Scenario: Display a list of more than 5 pages
  Given there is a page called "Test Page 1"
    And there is a page called "Test Page 2"
    And there is a page called "Test Page 3"
    And there is a page called "Test Page 4"
    And there is a page called "Test Page 5"
    And there is a page called "Test Page 6"
  When I am on the section page for "Test Section 1"
  Then I should see "Test Page 1"
   And I should see "Test Page 2"
   And I should see "Test Page 3"
   And I should see "Test Page 4"
   And I should see "Test Page 5"
   And I should not see "Test Page 6"
   And I should see "Next"
   And I should see "Add Page"
   #And show me the page
