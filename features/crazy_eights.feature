Feature: Test creating crazy eights games
  In order to make sure it works
  properly and is test-driven

  Scenario: createing game
    Given I am signed up and the signed in
    And I create a crazy eights game
    And I navigate to the crazy eights game list
    Then I should see the game displayed