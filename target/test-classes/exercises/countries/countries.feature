Feature: Get Countries tests

Background:
  Given url urlBase
  * java.lang.Thread.sleep(1500)

  Scenario Outline: Get information of <alphaCode>
    Given path pathAlpha
    And path <alphaCode>
    And param access_key = apiKeyValue
    When method get
    Then match response.name == <country>
    And status 200
    Examples:
      | alphaCode | country                                                |
      | 'US'      | 'United States of America'                             |
      | 'DE'      | 'Germany'                                              |
      | 'GB'      | 'United Kingdom of Great Britain and Northern Ireland' |

  Scenario Outline: Get information of inexistent countries - <country>
    Given path pathName
    And path <country>
    And param access_key = apiKeyValue
    When method get
    Then status 404
    And match response.message == 'Not Found'

    Examples:
      | country |
      | 'ioeydio diowad' |
      | '37432749032340' |
      | 'dd-+423-dwdwe{}'|

  Scenario: create a new country
    * def country =
      """
      {
          name: "Test Country",
          alpha2_code: "TC",
          alpha3_code: "TCY"
      }
      """
    Given path pathAll
    And  param access_key = apiKeyValue
    And request country
    When method post
    Then status 201
##    * def id = response.id#    * print 'created id is: ', id##    Given path id#    # When method get#    # Then status 200#    # And match response contains user