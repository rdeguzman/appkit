Feature: Page
  In order to create and manage a page
  As a normal
  I want to add, update, and delete a page and display a new and edit form

Background:
  Given I am on the new user session page
    And I logged as an @normal

Scenario: Show New Add Page Form
  When I am currently on the new page for section "Rooms"
  Then I should see "Add Page"
   And I should see "Title*"
   And I should see "Sub title"
   And I should see "Content*"

Scenario: Add Page
  Given I am currently on the new page for section "Rooms"
    And I fill in "Title" with "Test Room"
    And I fill in "Sub title" with "Executive Rooms"
    And I fill in "Content" with "Lorem Ipsum"
  When I press "Create Page"
  Then I should see "Test Room"
   And I should see a notice "Page was successfully created"
   #And show me the page

Scenario: Validate Page Name
  Given I am currently on the new page for section "Rooms"
  When I press "Create Page"
  Then I should see the error "Title can't be blank"

Scenario: Edit a Page
  Given I am currently on the edit page for "Deluxe Room"
  Then I should see "Edit Page"
  And the "Title" field should contain "Deluxe Room"

Scenario: Update a Page
  Given I am currently on the edit page for "Deluxe Room"
  When I press "Update Page"
  Then I should see "Page was successfully updated."

Scenario: Delete a Page with no destinations
  Given I am currently on the show page for "Page-For-Delete"
  When I follow "Delete"
  Then I should see "Page was successfully deleted"   

#Scenario: Delete a Page with many destinations
#  Given I am currently on the page page for "Deluxe Room"
#  When I follow "Delete"
#  Then I should see "You cannot delete a page if it has one or more pages"
#
