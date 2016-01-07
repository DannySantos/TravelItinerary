Feature: Editing todo item

@javascript
Scenario: A traveller updates a todo item
  Given a traveller is signed in
  Given a traveller has a journey
  Given a traveller has a todo item
  Then they select edit on a todo item
    And they edit the todo item
    And they select the save button
  Then the todo item should be updated
    And they should see the todo item update 
