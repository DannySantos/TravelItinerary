Feature: Creating a journey

@javascript
Scenario: A customer creates a journey
  Given a customer is on the homepage
    And they select create a new journey
  Then they should be on the create new journey page
    And they enter valid details
    And they press submit
  Then a journey is created
    And they are redirected to the journeys page

Scenario: A customer creates a journey without a title
  Given a customer is on the homepage
    And they select create a new journey
    And they enter a description
    And they press submit
  Then the journey is not created
    And they are shown a message saying "Please fill out all the fields"

Scenario: A customer creates a journey without a description
  Given a customer is on the homepage
    And they select create a new journey
    And they enter a title
    And they press submit
  Then the journey is not created
    And they are shown a message saying "Please fill out all the fields"
