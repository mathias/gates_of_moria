Feature: Winning the game
  In order to continue on to Ruby Warrior
  As a player
  I want to be told that I've won the game

  Scenario: winning the game
    Given I am not playing
    When I start a new quiz
    And I answer all the questions correctly
    Then I should see that I've won the game
