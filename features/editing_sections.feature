#Feature: Editing a section
#  In order to edit a section
#  As a user
#  I want to see sections updated appropriately
#
#Background:
#  Given I am on the new user session page
#    And I am logged as a @user
#    And there is an application called "Test Hotel"
#    And I am on the new section page for application "Test Hotel"
#
#Scenario: Display New Section Form
#  Then I should be on the new section page
#   And I should see "Add New Section"
#   And I should see "Title*"
#   #And the "section_submit" field should contain "Create Section"
#   #And show me the page
#
#Scenario: Creating a new section without a title
#  When I fill in "Title" with ""
#   And I press "Create Section"
#  Then I should see "error found"
#   And I should see "Title can't be blank"
#
#Scenario: Creating a new section
#  When I fill in "Title" with "Section1"
#   And I press "Create Section"
#  Then I should see "Section was successfully created"
#   And I should see "Section1"
#   And I should be on the app_profile page for "Test Hotel"
#   #And show me the page
