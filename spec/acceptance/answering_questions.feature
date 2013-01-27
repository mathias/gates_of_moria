Feature: Answering questions

  Scenario: user answers first question correctly
    Given I am not playing
    When I start a new quiz
    When I answer the first question correctly
    Then I should not see the first help text
    And I should see that I was correct
    And I should be prompted for the answer to the second question

  Scenario: user answers first question incorrectly
    Given I am not playing
    When I start a new quiz
    And I answer the first question incorrectly
    Then I should see the first help text
