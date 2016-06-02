Feature: Initialise a new workspace

  Background:
    Given a mocked home directory

  Scenario: Init a new folder with a csv file for the aliases
    When I run `sobriquet init`
    Then the file named "sobriquet.csv" should contain:
    """
    command | alias | description
    """
    And the output should contain:
    """
    Initialise a new sobriquet workspace in
    """

  Scenario: Init a new directory with a workspace option
    Given an empty directory named "test"
    When I run `sobriquet --workspace=test init `
    Then the output should contain:
    """
    Initialise a new sobriquet workspace in test
    """

