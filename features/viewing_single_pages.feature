Feature: Viewing a single page
  In order to view a single page
  As a user
  I want to see single page action links appropriately

Background:
  Given I am on the new user session page
    And I am logged as a @normal
    And there is an application called "Test Hotel"
    And there is a single page called "Test Single Page 1"

Scenario: Display Edit Single Page 
  Given I am on the single_page page for "Test Single Page 1"
  When I follow "Edit"
  Then I should see "Edit Single Page"
