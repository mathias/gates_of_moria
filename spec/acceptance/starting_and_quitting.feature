Feature: Starting and Quitting
  As a player
  I want to start the quiz
  So that I can proceed to Ruby Warrior

  Scenario: starting and quitting the game
    Given I am not playing
    When I start a new quiz
    Then I should see the Gates of Moria
    And I should be prompted for the answer to the first question

    When I quit
    Then the game should end
