Feature: Home Page
  In order to show the home page to the public
  As a normal or admin
  I want to show the links, important sections the map, attractions and hotels

Scenario: Show Header Links
  When I go to the home page
  Then I should see the link "Home" from header
    And I should see the link "About Us" from header
    And I should see the link "Contact Us" from header
    And I should see the link "Log In" from header
