Feature: Authentication API Test

  Scenario: Generate Token for Valid Credentials
    Given url 'https://restful-booker.herokuapp.com/auth'
    And request { username: 'admin', password: 'password123' }
    When method POST
    Then status 200
    And match response == { token: '#string' }
    * def authToken = response.token
    * print 'Auth Token is:', authToken



