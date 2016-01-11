Feature: A provider signs up

@javascript @wip
Scenario: Provider signs up
  Given a visitor is on the homepage
    And they choose to sign up as a provider
  Then they are taken to the provider sign up page
  Then they fill in the provider form with valid details
    And they select Sign up
    And they are signed up as a provider
    And they are taken to the provider dashboard