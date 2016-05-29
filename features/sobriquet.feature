Feature: Sobriquet alias management

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

  Scenario: Init a new folder with a csv option
    Given a mocked home directory
    When I run `sobriquet init `
    Then the file named "sobriquet.csv" should contain:
    """
    command | alias | description
    """

  Scenario: Add an alias with descriptions
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
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

  Scenario: generate the alias file every time i run the generate command
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
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
