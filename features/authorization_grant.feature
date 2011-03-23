Feature: Client desires an authorization grant
  In order for a client to get an access token
  As an authentication server
  When a client requests an authorization grant
  I want to dispense one

  Scenario Outline: Wrong number of submitted query parameters
    Given I am not logged in
    When I do a custom visit to <wrong_params_page>
    Then I should be on "/oauth2/missing_info"
  
    Examples:
    |wrong_params_page                                                        |
    |/oauth2/authenticate?response_type=code&client_id=123456                 |
    |/oauth2/authenticate?redirect_uri=www.google.com&client_id=123456        |
    |/oauth2/authenticate?redirect_uri=www.google.com&response_type=code      |

  Scenario: Successful login
    Given I am not logged in
    And user "marvin" with email "marvin@tty.nl" and password "123456" exists
    When I go to "/user/login"
    And I fill in "email" with "marvin@tty.nl"
    And I fill in "password" with "123456"
    And I press "Login"
    Then I should be on "/user/validate"    
    Then I should see "Congratulations!"
  
  Scenario: Everything goes well
    Given I log in as "marvin" with email "marvin@tty.nl" and with password "123456"
    And client with name "japie_krekel", client_id "159832" and client_secret "superdupersecret" exists
    And I do a custom visit to /oauth2/authenticate?response_type=code&client_id=159832&redirect_uri=localhost/oauth2/granted
    Then I should see "permission"
    And I should see "Allow"
    Then I follow "Allow"
    Then I should see "given your permission"