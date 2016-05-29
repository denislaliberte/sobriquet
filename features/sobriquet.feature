Feature: Sobriquet alias management

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

  Scenario: Init a new folder
    Given an empty directory named "test"
    When I run `sobriquet --csv=test/sobriquet.csv init `
    Then the output should contain:
    """
    in test
    """
    And the file named "test/sobriquet.csv" should contain:
    """
    command | alias | description
    """

  Scenario: Add an alias
    Given a file named "test/sobriquet.csv" with:
    """
    command | alias | description
    """
    When I run `sobriquet --csv=test/sobriquet.csv add -d 'get the status of the git directory' gs 'git status' `
    Then the output should contain:
    """
    Added new sobriquet gs | git status
    """
    And the file named "test/sobriquet.csv" should contain:
    """
    "git status" | gs | "get the status of the git directory"
    """

  Scenario: generate the alias file
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
    """
    command | alias | description
    "git status" | gs
    """
    When I run `sobriquet generate`
    Then the output should contain:
    """
    generate alias file
    """
    And the file named "sobriquet.sh" should contain exactly:
    """
    alias gs='git status'
    """

  Scenario: generate the alias file multiple time
    Given a mocked home directory
    And a file named "sobriquet.csv" with:
    """
    command | alias | description
    "git status" | gs
    """
    And I run `sobriquet  generate`
    And I run `sobriquet generate`
    Then the file named "sobriquet.sh" should contain exactly:
    """
    alias gs='git status'
    """
