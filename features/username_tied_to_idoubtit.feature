Feature: Test username is tied to idoubtit
  In order to make sure it works
  properly and is test-driven

  @javascript
  Scenario: Playing game
    Given I am signed up and signed in
    And I navigate to the game page
    Then It should display my username