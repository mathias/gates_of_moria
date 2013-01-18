Feature: Player Starts the Quiz
  As a player
  I want to start the quiz
  So that I can proceed to Ruby Warrior

  Scenario: start quiz
    Given I am not playing
    When I start a new quiz
    Then I should see the Gates of Moria
    And I should be prompted for input
