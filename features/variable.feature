Feature: Add a variable to sobriquet data file

  Background:
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
    """
    command | alias | description
    """

  @wip
  Scenario: Add a variable
    When I run `sobriquet variable om 'origin master'`
    Then the output should contain:
    """
    Added new variable om | origin master
    """
    And the file named "sobriquet.csv" should contain:
    """
    "origin master" | om | "no description"
    """

  Scenario: Add an alias with verbose flag
    When I run `sobriquet --verbose add gs 'git status' `
    Then the output should match /Sobriquet added to the file .*sobriquet.csv/

