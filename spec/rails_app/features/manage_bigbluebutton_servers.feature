Feature: Manage BigBlueButton servers
  In order to held webconferences
  One needs to be able to create and manage BigBlueButton servers

  Scenario: Register a new BigBlueButton server
    Given a user named "test user"
    When he goes to the new server page
      And registers a new server
    Then he should see the information about this server