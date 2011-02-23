Feature: Authenticate
  In order to authenticate a user
  As a system using devise
  I want to show the correct redirect page for a logged user
  
Scenario: User logged-in from Login page
  Given I am on the new user session page
    And I am logged as a @user
   Then I should see "Signed in successfully"
    And I should be on the app_profiles page
    #And I should see links "My Profile"
    #And I should see links "Logout"
    #And I should see links "My Apps"
