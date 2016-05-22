Feature: Sobriquet alias management

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

  Scenario: Init a new folder
    Given an empty directory named "test"
    When I run `sobriquet init test`
    Then the output should contain:
    """
    in test
    """
    And the file named "test/sobriquet.csv" should contain:
    """
    bin | arguments | alias | description
    """

  Scenario: Add an alias
    Given an empty directory named "test"
    When I run `sobriquet init test`
    And I run `sobriquet add gs 'git status'`
    Then the output should contain:
    """
    Added new sobriquet gs | git status
    """
    And the file named "test/sobriquet.csv" should contain:
    """
    "git status" | gs
    """
