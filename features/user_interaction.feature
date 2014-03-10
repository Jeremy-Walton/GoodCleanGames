Feature: Test user interaction
  In order to make sure is works
  correctly

  Scenario: visiting website
    Given I visit the front page
    And I click sign up
    When I fill in the form
    Then I am signed in

  Scenario: visiting the games page
    Given I am signed up and signed in
    And I click the games link
    Then I should see a list of games
    When I click to play I Doubt It
    Then I should see the game