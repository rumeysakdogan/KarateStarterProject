Feature: Searching Movie from open movie DB

  Background:
    * url 'http://www.omdbapi.com/'
#?t=John Wick&apiKey=ab665c9c
  Scenario:
    Given param apiKey = 'ab665c9c'
    And param t = 'John Wick'
    When method get
    Then status 200
    # assert 3-5 fields below here
   Then assert response.Year == '2014'
    And assert response.Writer == 'Derek Kolstad'
    And assert response.Ratings[1].Value == '86%'