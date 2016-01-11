Feature: Add property

@javascript
Scenario: A provider adds a property
  Given a provider is signed in
  Given a provider is on the provider dashboard
    And they select to add a new property
    And they enter valid property details
    And they they select the create property button
  Then a property item should be created
    And they should see the property 