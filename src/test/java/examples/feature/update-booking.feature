Feature: Update Booking API Test

Background:
  * url baseUrl = 'https://restful-booker.herokuapp.com'
  * def commonHeaders =
    """
    {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.28.4',
      'Accept': '*/*',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection': 'keep-alive'
    }
    """

Scenario: Full Booking Update Flow
  * def auth = call read('auth.feature')
  * def token = auth.authToken
  * def booking = call read('create-booking.feature')
  * def bookingId = booking.bookingId
  * def updatePayload = read('classpath:examples/payloads/update-valid-booking.json')

  Given url baseUrl + '/booking/' + bookingId
  And headers commonHeaders
  And header Cookie = 'token=' + token
  And request updatePayload
  When method PUT
  Then status 200

Scenario: Update booking with invalid token
  * def auth = call read('auth.feature')
  * def booking = call read('create-booking.feature')
  * def bookingId = booking.bookingId
  * def payload = read('classpath:examples/payloads/valid-booking.json')

  Given url baseUrl + '/booking/' + bookingId
  And headers commonHeaders
  And header Cookie = 'token=invalidtoken123'
  And request payload
  When method PUT
  Then status 403

Scenario: Update booking with missing required field
  * def auth = call read('auth.feature')
  * def booking = call read('create-booking.feature')
  * def bookingId = booking.bookingId
  * def payload = read('classpath:examples/payloads/invalid-booking-missing-firstname.json')

  Given url baseUrl + '/booking/' + bookingId
  And headers commonHeaders
  And header Cookie = 'token=invalidtoken123'
  And request payload
  When method PUT
  Then status 403
