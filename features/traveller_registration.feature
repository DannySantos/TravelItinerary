Feature: Traveller Registration

@javascript
Scenario: A visitor signs up
  Given a visitor is on the sign up page
    And they enter valid signup details
    And they select the signup button
  Then the account is created
    And they are redirected to their dashboard

@javascript
Scenario: A traveller signs up without a username
  Given a visitor is on the sign up page
    And they enter valid details excluding the username
    And they select the signup button
  Then the account is not created
    And they are shown a message saying "Username can't be blank"

@javascript
Scenario: A traveller signs up with a username that is already taken
  Given a visitor is on the sign up page
    And they enter valid details with an already taken username
    And they select the signup button
  Then the account is not created as the username is already taken
    And they are shown a message saying "Username has already been taken"