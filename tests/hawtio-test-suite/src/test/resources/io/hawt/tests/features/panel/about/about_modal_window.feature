Feature: Check whether all data is presented and displayed correctly in About modal window.

  @notOnline
  Scenario Outline: Check that the titles are presented in About modal window
    Given User clicks on "About" option in Question mark drop-down menu
    Then The "Hawtio Management Console" header is presented in About modal window
    And The "<component>" is presented in About modal window
    Then About modal window is closed

    Examples: Names of Hawtio's Components
      | component    |
      | Hawtio React |

  @online
  Scenario Outline: Check that the titles are presented in About modal window
    Given User clicks on "About" option in Question mark drop-down menu
    Then The "Red Hat build of HawtIO" header is presented in About modal window
    And The "<component>" is presented in About modal window
    Then About modal window is closed

    Examples: Names of Hawtio's Components
      | component     |
      | Hawtio React  |
      | Hawtio Online |

  @notOnline
  Scenario: Verify Hawtio React version in About modal (debug)
    Given User clicks on "About" option in Question mark drop-down menu
    Then The Hawtio React version should be captured and verified
    And About modal window is closed
