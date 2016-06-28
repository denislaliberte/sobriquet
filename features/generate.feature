Feature: Generate a shell file to declare alias and import variables

  Background:
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
    """
    command | alias | description | type
    "git status" | gs | "get the status of the git directory" | command
    "origin master" | om | "no description" | variable
    """

  Scenario: generate the alias file every time i run the generate command
    When I run `sobriquet generate`
    And I run `sobriquet generate`
    Then the output should contain:
    """
    generate alias file
    """
    And the file named "sobriquet.sh" should contain:
    """
    # description : get the status of the git directory
    """
    And the file named "sobriquet.sh" should contain:
    """
    alias gs="git status"
    """
    And the file named "sobriquet.sh" should contain:
    """
    export om="origin master"
    """

  Scenario: Generate the alias flag with verbose flag
    When I run `sobriquet --verbose generate`
    Then the output should match /alias generated from the csv file .*sobriquet.csv/

