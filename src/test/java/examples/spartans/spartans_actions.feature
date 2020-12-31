Feature: Spartans App Featue testing

  Background:
    * url 'http://52.201.187.226:8000/'
    * path '/api'

    Scenario: User should be able to call /api/hello to get greeting
      Given path '/hello'
      When method get
      Then status 200
      # checking content type header
      # use match rather than assert when you assert the part of response
      Then match header Content-Type == 'text/plain;charset=UTF-8'
      # checking the payload
      Then assert response == 'Hello from Sparta'

      Scenario: Spartan CRUD Operation

        * def payload =
        """
        {
          "name":"Tucky",
          "gender":"Male",
          "phone":1231231234
        }
        """
        Given path 'spartans'
        And header Content-Type = 'application/json'
        And request payload
        When method post
        Then status 201
        Then assert response.success == 'A Spartan is Born!'

## Keep going from here and test you can access the data you just added
## send another GET request

        * def newID = response.data.id
        Given path '/api/spartans/' , newID
        When method get
        Then status 200
        Then match header Content-Type == 'application/json'

## Update the data with new body
        * def newPayload =
         """
        {
          "name":"Virginia",
          "gender":"Female",
          "phone":1234567890
        }
        """
        Given path '/api/spartans' , newID
        And header Content-Type = 'application/json'
        And request newPayload
        When method put
        Then status 204

  ### Send another get request to make sure this worked

        When path 'api/spartans' , newID
        And method get
        Then status 200
        Then assert response.name == newPayload.name
        Then assert response.gender == newPayload.gender
        Then assert response.phone == newPayload.phone


## Send a delete request to clean up this data
        Given path '/api/spartans/' , newID
        When method delete
        Then status 204

### Send another get request to make sure this worked
        Given path '/api/spartans/' , newID
        When method get
        Then status 404