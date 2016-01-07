Feature: Deleting a todo item

@javascript @wip
Scenario: A traveller deletes a todo item
  Given a traveller is signed in
  Given a traveller has a journey
  Given a traveller has a todo item
  Then they select delete on a todo item
  Then the todo item should be deleted
    And they should see the todo item removed 
