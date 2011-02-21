Feature: Authenticate
  In order to authenticate a user
  As a system using devise
  I want to show the appropriate landing page for the logged user
  
Scenario: User logged-in from Login page
  Given I am on the new user session page
    And I logged as an @normal
   Then I should see "Signed in successfully"
    #Then show me the page

Scenario: User redirects to sections page on successful login
  Given I am on the new user session page
    And I logged as an @normal
   Then I should see "Signed in successfully"
    And I should be on the sections page
