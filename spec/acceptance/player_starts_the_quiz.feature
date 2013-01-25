Feature: Player Starts the Quiz
  As a player
  I want to start the quiz
  So that I can proceed to Ruby Warrior

  Scenario: start quiz
    Given I am not playing
    When I start a new quiz
    Then I should see the Gates of Moria
    And I should be prompted for the answer to the first question

  Scenario: user answers first question correctly
    Given I am not playing
    When I start a new quiz
    When I answer the first question correctly
    Then I should be prompted for the answer to the second question

  Scenario: user answers first question incorrectly
    Given I am not playing
    When I start a new quiz
    And I answer the first question incorrectly
    Then I should see the first help text
