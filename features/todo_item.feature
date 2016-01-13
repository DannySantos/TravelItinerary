Feature: Rentals Near Item

@javascript
Scenario: A traveller sees the number of rentals near to a todo item
  Given a traveller is signed in
  Given a traveller has a journey
  Given a todo item exists
  Given a rental properties exist
    And they select to view nearby rental properties
  Then they should see the number of rentals near to that item
  