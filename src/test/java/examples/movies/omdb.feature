Feature: Searching Movie from open movie DB

  Background:
    * url 'http://www.omdbapi.com/'
    * param apiKey = 'ab665c9c'

#http://www.omdbapi.com/?t=John Wick&apiKey=ab665c9c

  Scenario:
    #Given param apiKey = 'ab665c9c'
    And param t = 'John Wick'
    When method get
    Then status 200
    # assert 3-5 fields below here
    Then assert response.Year == '2014'
    And assert response.Writer == 'Derek Kolstad'
    And assert response.Ratings[1].Value == '86%'

  Scenario Outline: Search for multiple movie with name <movie_name>
    Given param t = '<movie_name>'
    When method get
    Then status 200
    And match response.Year == '<year>'
    Examples:
      | movie_name                     | year |
      | Wonder Woman 1984              | 2020 |
      | Life is beautiful              | 1997 |
      | John Wick                      | 2014 |
      | Bad Boys for Life              | 2020 |
      | Contact                        | 1997 |
      | The Godfather                  | 1972 |
      | The Good, the Bad and the Ugly | 1966 |