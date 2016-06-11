Feature: Add alias to sobriquet data file

  Background:
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
    """
    command | alias | description
    """

  @wip
  Scenario: Add an alias with descriptions
    When I run `sobriquet add -d 'get the status of the git directory' gs 'git status' `
    Then the output should contain:
    """
    Added new sobriquet gs | git status
    """
    And the file named "sobriquet.csv" should contain:
    """
    "git status" | gs | "get the status of the git directory"
    """

  Scenario: Add an alias with verbose flag
    When I run `sobriquet --verbose add gs 'git status' `
    Then the output should match /Sobriquet added to the file .*sobriquet.csv/

