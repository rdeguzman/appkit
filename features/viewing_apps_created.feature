Feature: Viewing applications
  In order to see a list of applications in the home page
  As a user
  I want to see a list of applications

Scenario: Viewing application list in home page
  Given there is an application called "Test Hotel 100"
    And there is an application called "Test Hotel 101"
  When I am on the home page
  Then I should see "Test Hotel 100"
    And I should see "Test Hotel 101"
    #And show me the page
