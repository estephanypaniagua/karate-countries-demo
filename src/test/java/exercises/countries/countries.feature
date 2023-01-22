Feature: Countries tests

  Background:
    Given url urlBase
    * java.lang.Thread.sleep(1500)
    * def res_get_alpha = read('../responses/countryByAlphaCode.json')
    * def res_get_error = read('../responses/error404.json')


  Scenario Outline: Get information of <alphaCode>
    Given path pathAlpha
    And path <alphaCode>
    And param access_key = apiKeyValue
    When method get
    Then match response.name == <country>
    And match response == res_get_alpha
    And status 200
    Examples:
      | alphaCode | country                                                |
      | 'US'      | 'United States of America'                             |
      | 'DE'      | 'Germany'                                              |
      | 'GB'      | 'United Kingdom of Great Britain and Northern Ireland' |

  Scenario Outline: Get information of inexistent countries - <state>
    Given path pathName
    And path <country>
    And param access_key = apiKeyValue
    When method get
    Then match response.message == 'Not Found'
    And match response == res_get_error
    And status 404

    Examples:
      | country          | state                     |
      | 'ioeydio diowad' | 'alphabetic'              |
      | '37432749032340' | 'numeric'                 |
      | 'dd-+423-dwdwe{}'| 'with special characters' |

  Scenario: Create a new country
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
    And match response.name == "Test Country"
