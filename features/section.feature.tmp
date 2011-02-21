Feature: Section
  In order to create and manage a section
  As a normal
  I want to add, update, and delete a section and display a new and edit form

Background:
  Given I am on the new user session page
    And I logged as an @normal

Scenario: Show New Add Section Form
  When I am on the new section page
  Then I should see "Add Section"
  Then I should see "Title*"

Scenario: Add Section
  Given I am on the new section page
    And I fill in "Title" with "Overview"
  When I press "Create Section"
  Then I should see "Overview"
   And I should see a notice "Section was successfully created"
#   And show me the page

Scenario: Validate Section Name
  Given I am on the new section page
  When I press "Create Section"
  Then I should see the error "Title can't be blank"

@focus
Scenario: Edit a Section
  Given I am currently on the edit section page for "Overview"
  Then I should see "Edit Section"
  And the "Title" field should contain "Overview"

Scenario: Update a Section
  Given I am currently on the edit section page for "Overview"
  When I press "Update Section"
  Then I should see "Section was successfully updated."

Scenario: Delete a Section with no destinations
  Given I am currently on the section page for "Overview-For-Delete"
  When I follow "Delete"
  Then I should see "Section was successfully deleted"   

Scenario: Delete a Section with many destinations
  Given I am currently on the section page for "Overview"
  When I follow "Delete"
  Then I should see "You cannot delete a section if it has one or more pages"

Scenario: Display pages for section
  Given I am currently on the section_pages page for "Overview"
  Then I should see "Overview"
  And I should see "Welcome to Cebu"
