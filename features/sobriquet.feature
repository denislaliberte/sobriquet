Feature: Sobriquet alias management

  Scenario: App just runs
    When I get help for "sobriquet"
    Then the exit status should be 0

