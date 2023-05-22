Feature: Checking the functionality of a specific camel context page.

  @quarkusSmokeTest @quarkusAllTest
  Scenario Outline: Check that table of Attribute tab in Camel Specific Context page is not empty
    Given User is on "Camel" page
    And User is on Camel "SampleCamelQuarkus" context
    When User clicks on Camel "Attributes" tab
    Then Camel table "<column>" column is not empty
    And Camel table has "<attribute>" key and "<value>" value

    Examples: Attributes and values
      | column    | attribute | value              |
      | Attribute | CamelId   | SampleCamelQuarkus |
      | Value     | State     | Started            |

  @quarkusAllTest
  Scenario: Check to execute operation of Specific Context
    Given User is on "Camel" page
    And User is on Camel "SampleCamelQuarkus" context
    When User clicks on Camel "Operations" tab
    When User executes operation with name "getCamelId()"
    Then Result of "getCamelId()" operation is "SampleCamelQuarkus"

  @quarkusAllTest
  Scenario: Check the suspend action with Camel Specific Context.
    Given User is on "Camel" page
    And User is on Camel "SampleCamelQuarkus" context
    When User clicks on Camel "Operations" tab
    And User executes operation with name "suspend()"
    Then Result of "suspend()" operation is "Operation Succeeded!"
    And User clicks on Camel "Attributes" tab
    And Camel table has "State" key and "Suspended" value

  @quarkusAllTest
  Scenario: Check the start action with Camel Specific Context.
    Given User is on "Camel" page
    And User is on Camel "SampleCamelQuarkus" context
    When User clicks on Camel "Operations" tab
    And User executes operation with name "start()"
    Then Result of "start()" operation is "Operation Succeeded!"
    And User clicks on Camel "Attributes" tab
    And Camel table has "State" key and "Started" value

