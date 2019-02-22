Feature: Employee creation functionality

  Scenario: Elements are displayed correctly on New Employees page
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    When user clicks on Create
    Then the 'New Employees' page is displayed with following elements
      | First name |
      | Last name  |
      | Start date |
      | Email      |
      | Add        |

  Scenario: User can create New Employees
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on Create
    And user fills-in employee details with the following data
      | firstName    | lastName    | startDate  | email          |
      | ECFirstName2 | ECLastName2 | 2007-08-01 | test@email.com |
    When user clicks on Add
    And user is redirected to Employees page
    Then employee was created successfully

  Scenario: New Employee is not created when user clicks on Cancel
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on Create
    And user fills in employee details with the following data
      | firstName    | lastName    | startDate  | email          |
      | ECFirstName2 | ECLastName2 | 2007-08-01 | test@email.com |
    When user clicks on Cancel
    Then user is redirected to Employees page
    And user is not created

  Scenario Outline: Check error messages for unsuccessful employee creation
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on Create
    When user fills in employee details with the following data
      | firstName   | lastName   | startDate   | email   |
      | <firstname> | <lastname> | <startdate> | <email> |
    And user clicks on Add
    Then tooltip message '<message>' is displayed
    Examples:
      | firstname | lastname | startdate  | email          | message                                                           |
      |           | MyName1  |            |                | Please fill out this field.                                       |
      | MyName1   |          |            |                | Please fill out this field.                                       |
      |           |          | 2007-08-01 |                | Please fill out this field.                                       |
      | MyName1   | MyName2  |            | test@email.com | Please fill out this field.                                       |
      | MyName1   | MyName2  | 2007-08-01 | test           | Please include an '@' in the email address. 'test' is missing '@' |
      | MyName1   | MyName2  | 2007-08-01 | test@          | Please enter a part following'@'. 'test@' is incomplete           |
