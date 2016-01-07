Feature: Traveller sign in

@javascript
Scenario: A traveller signs in
  Given a traveller is on the sign in page
    And they enter valid login details
    And they click the sign in button
  Then they should be taken to their dashboard