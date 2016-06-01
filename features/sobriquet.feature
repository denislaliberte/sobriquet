Feature: Sobriquet alias management

  Background:
    Given a mocked home directory

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

  Scenario: Init a new folder with a csv file for the aliases
    When I run `sobriquet init `
    Then the file named "sobriquet.csv" should contain:
    """
    command | alias | description
    """
    And the output should contain:
    """
    Initialise a new sobriquet workspace in
    """

  Scenario: Add an alias with descriptions
    Given a file named "sobriquet.csv" with:
    """
    command | alias | description
    """
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
    Given a file named "sobriquet.csv" with:
    """
    command | alias | description
    """
    When I run `sobriquet --verbose add gs 'git status' `
    Then the output should match /Sobriquet added to the file .*sobriquet.csv/

  Scenario: generate the alias file every time i run the generate command
    Given a file named "sobriquet.csv" with:
    """
    command | alias | description
    "git status" | gs | "get the status of the git directory"
    """
    When I run `sobriquet generate`
    And I run `sobriquet generate`
    Then the output should contain:
    """
    generate alias file
    """
    And the file named "sobriquet.sh" should contain exactly:
    """
    # description : get the status of the git directory
    alias gs='git status'
    """

  Scenario: Generate the alias flag with verbose flag
    Given a file named "sobriquet.csv" with:
    """
    command | alias | description
    "git status" | gs | "get the status of the git directory"
    """
    When I run `sobriquet --verbose generate`
    Then the output should match /alias generated from the csv file .*sobriquet.csv/

  Scenario: Init a new directory with a workspace option
    Given an empty directory named "test"
    When I run `sobriquet --workspace=test init `
    Then the output should contain:
    """
    in test
    """
    And the file named "test/sobriquet.csv" should contain:
    """
    command | alias | description
    """
