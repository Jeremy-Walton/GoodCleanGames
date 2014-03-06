Feature: Test user interaction
  In order to make sure is works
  correctly

  Scenario: visiting website
    Given I visit the front page
    And I click sign up
    When I fill in the form
    Then I am signed in
    And I visit the games page
    Then the page should display the Game