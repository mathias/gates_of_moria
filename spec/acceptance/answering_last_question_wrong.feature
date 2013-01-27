Feature: Answering Last Question Wrong

  Scenario: User answers last question wrong
    Given I am not playing
    When I start a new quiz
    And I answer all questions up to the last one
    And I answer the last question incorrectly
    Then I should see encouraging text to keep trying
