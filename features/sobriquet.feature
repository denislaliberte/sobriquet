Feature: Sobriquet alias management

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

  Scenario: Init a new folder
    When I run `sobriquet init`
    Then the file named "sobriquet.csv" should contain:
    """
    bin | arguments | alias | description
    """
