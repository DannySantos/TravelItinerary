Feature: Add todo item

@javascript @wip
Scenario: A traveller adds a todo item
  Given a traveller is signed in
  Given a traveller has a journey
    And they select to add a new todo item
    And they enter valid todo item details
    And they they select the create item button
  Then a todo item should be created
    And they should see the todo item 