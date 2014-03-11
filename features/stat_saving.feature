Feature: Test saving stats
  In order to make sure it works
  properly and is test-driven

  @javascript
  Scenario: Playing game
    Given I am signed up and the signed in
    And I navigate to the game page starting the game
    And I navigate to the stats page
    Then I should see the updated stats