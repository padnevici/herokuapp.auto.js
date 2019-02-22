Feature: Employee amendment functionality

  Scenario: User can view employee details
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user can see a list of employees
    When user clicks on first employee
    Then employee details are dispalyed

  Scenario: User can edit employee details
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Edit
    And user updates employee details with the following data
      | firstName     | lastName     | startDate  | email          |
      | ECFirstName)) | ECLastName)) | 2002-01-01 | test@email.com |
    When user clicks on Update
    Then employee was updated successfully

  Scenario: User cannot edit employee details when browser is closed
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Edit
    And user fills in employee details with the following data
      | firstName    | lastName    | startDate  | email          |
      | ECFirstName1 | ECLastName1 | 2002-01-01 | test@email.com |
    When user closes browser
    Then employee details are not updated

  Scenario: Employee details are not updated if user refreshes page during editing
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Edit
    And user fills in employee details with the following data
      | firstName    | lastName    | startDate  | email          |
      | ECFirstName1 | ECLastName1 | 2002-01-01 | test@email.com |
    When user refreshes the page
    Then employee details are not updated

  Scenario: Employee details are not updated if user clicks on back button
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Edit
    And user fills in employee details with the following data
      | firstName    | lastName    | startDate  | email          |
      | ECFirstName1 | ECLastName1 | 2002-01-01 | test@email.com |
    When user clicks on Back
    Then employee details are not updated