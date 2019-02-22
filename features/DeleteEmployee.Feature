Feature: Employee delete functionality

  Scenario: User can delete employee
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Delete
    And module dialog is displayed
    When user clicks on Ok
    Then employee is deleted

  Scenario: Employee is not deleted when user choose cancel
    Given user navigates to Login page
    And user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on first employee
    And user clicks on Delete
    And module dialog is displayed
    When user clicks on Cancel
    Then employee is displayed in the list