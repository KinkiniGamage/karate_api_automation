Feature: Create Booking API Test

  Scenario: Create a booking with valid details
    Given url 'https://restful-booker.herokuapp.com/booking'
    And header Content-Type = 'application/json'
    And header User-Agent = 'PostmanRuntime/7.28.4'
    And header Accept = '*/*'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header Connection = 'keep-alive'
    And request { firstname: 'Jim', lastname: 'Brown', totalprice: 111, depositpaid: true, bookingdates: { checkin: '2018-01-01', checkout: '2019-01-01' }, additionalneeds: 'Breakfast' }
    When method POST
    Then status 200
    And match response.booking.firstname == 'Jim'
    And match response.booking.lastname == 'Brown'
