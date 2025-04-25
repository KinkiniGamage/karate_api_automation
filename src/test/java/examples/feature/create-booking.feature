Feature: Create Booking API Test

  Scenario: Create a booking with valid details
    * def payload = read('classpath:examples/payloads/valid-booking.json')

    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header User-Agent = 'PostmanRuntime/7.28.4'
    And header Accept = '*/*'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'keep-alive'
    And request payload
    When method POST
    Then status 200
    And match response.booking.firstname == 'Jim'
    And match response.booking.lastname == 'Brown'
    * def bookingId = response.bookingid
    * print 'Booking ID is:', bookingId
