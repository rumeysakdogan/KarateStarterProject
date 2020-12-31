Feature: Searching Spartan by name and gender

  Background:
    * url 'http://52.201.187.226:8000/'


  Scenario: User should be able to search
    Given path 'api/spartans/search'
    And param nameContains = 'a'
    And param gender = 'Female'
    When method get
    Then status 200
    # verify the gender field returned correctly to get everything as array use *
    * match each response.content[*].gender == 'Female'
    # first make the response body lowercase so we do not have to worry about the case sensivity
    * def responseToLowerCase = karate.lowerCase(response)
    * match each responseToLowerCase.content[*].name contains 'a'
