Feature: Users should be able to search city info by zipcode
  examples url https://api.zippopotam.us/us/90210

  Background: 
    * url 'https://api.zippopotam.us'

    Scenario: Get city info using zipcode
      Given path 'us/90210'
      When method get
      Then status 200