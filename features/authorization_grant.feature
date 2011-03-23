Feature: Client desires an authorization grant
  In order for a client to get an access token
  As an authentication server
  When a client requests an authorization grant
  I want to dispense one
  
  # Scenario: sometest
  #     When I go to "/oauth/authenticate?foo=bar"
  #     Then params[:foo] should be 'bar'
    
  # Scenario: Invalid params
  #     When I go to "/oauth/authenticate?foo=bar"
  #     Then I should get a response '400' with the following json:
  #       """
  #       { "errors" : "no credentials given" }
  #       """
     
  Scenario: Incomplete query string parameters 
    Given I am not logged in
    When I go to "/oauth2/authenticate?foo=bar"
    #Then I should be redirected to "oauth2/missing_info"
    Then I should be on "/oauth2/missing_info"
    
  # Scenario Outline: Even more incomplete query string parameters 
  #     Given I am not logged in
  #     When I go to <wrong_params_page>
  #     #Then I should be redirected to "oauth2/missing_info"
  #     Then I should be on "/oauth2/missing_info"  
    
  Scenario Outline: Wrong number of submitted query parameters
    Given I am not logged in
    When I do a custom visit to <wrong_params_page>
    #Then I should be redirected to "oauth2/missing_info"
    Then I should be on "/oauth2/missing_info"
  
    Examples:
    |wrong_params_page                                                        |
    |/oauth2/authenticate?response_type=code&client_id=123456                 |
    |/oauth2/authenticate?redirect_uri=www.google.com&client_id=123456        |
    |/oauth2/authenticate?redirect_uri=www.google.com&response_type=code      |
    
  @testur
  Scenario: Goin' for a ride
    When I go to "/scaffold/dilla"
    Then I should see "Mami"
    And I press "BAM!!!"
    Then I should be on "/scaffold/jayz"
    Then I should see "izzo"
    
  @failing  
  Scenario: Succesfull login
    Given I am not logged in
    And user "marvin" with email "marvin@tty.nl" and password "123456" exists
    When I go to "/user/login"
    And I fill in "email" with "marvin@tty.nl"
    And I fill in "password" with "123456"
    And I press "Login"
    Then I should be on "/user/validate"    
    Then I should see "Congratulations!"
    #Then It must be spring
    #Then I should be redirected to "success"
  

  # Scenario: Succesfull authentication
  #     Given I am logged in
  #     When I go to "/oauth/authenticate?foafso=bar"
  #     Then I should be redirected to "success"
    
