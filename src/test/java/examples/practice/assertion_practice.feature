Feature: Practice Assertion The Karate Way

  Scenario: Simple assertion for number

    Given def num1 = 10
    And def num2 = 20
    Then assert num1 + num2 == 30

  #unlike cucumber
# none of the Given When Then keyword is required
# You can always replace it by * , it's for readability
    * print 'Hello World !'
    * print 'Hello World !' + num1
    * print 'Hello World !' , num1

    Scenario: Working with Simple Json
      * def myJson = { name : 'Tucky' , nums : [99, 88, 54] }
      * print 'Whole Json is ' , myJson
      * print 'The name is ' , myJson.name
      * print 'The second number in the json is ' , myJson.nums[1]
      # assert the name is tucky, last number is 54
      * assert myJson.name == 'Tucky'
      * assert myJson.nums[2] == 54
      * match myJson.name == 'Tucky'
