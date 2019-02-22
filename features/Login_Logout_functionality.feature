Feature: Login Logout functionality

  Scenario: User is able to introduce his credentials
    When user navigates to Login page
    Then there are fields for user name and password on Login page

  @Run
  Scenario: User is logged on with valid password and user name
    Given user navigates to Login page
    When user logs in with 'Luke' username and 'Skywalker' password
    Then user is redirected to Employees page

  Scenario Outline: User is not logged on with invalid credentials
    Given user navigates to Login page
    When user logs in with '<username>' username and '<password>' password
    Then error message 'Invalid username or password!' is displayed
    Examples:
      | username | password  |
      | Luke     | password1 |
      | Noname   | Skywalker |
      | Noname   | password1 |

  Scenario Outline: User cannot log in  with empty credentials
    Given user navigates to Login page
    When user logs in with '<username>' username and '<password>' password
    Then tooltip message 'Please fill out this field.' is displayed
    Examples:
      | username | password  |
      |          |           |
      |          | Skywalker |
      | Luke     |           |

  Scenario: User logs out
    Given user navigates to Login page
    When user logs in with 'Luke' username and 'Skywalker' password
    And user is redirected to Employees page
    And user clicks on Logout
    Then user is redirected to Login page