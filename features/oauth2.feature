Feature: Establish an oauth2 connection between server and client
  In order to make it possible for a client to obtain resources from a restricted server
  As an authentication server
  I want to provide the necessary tokens to the client
  
  # Maybe next scenario needs another location?? Yeah, probably
  Scenario: Client registers itself
    Given I go to "/register"
    And I fill in "client_id" with "123123"
    And I fill in "secret" with "verysecret"
    When I press "Save"
    Then a client should exist
    

  # Scenario: send an authorization code to the client
  #   Given a client exists
  #   When a client sends a request for an authorization code # How is this request specified?
  #   Then I should send an authorization code
  #   
  # Scenario: send an access token to the client
  #   Given a client provides an authorization code
  #   and a client or resource owner provides credentials
  #   then I should send an access token
    
  # Refresh token scenario






# Feature: Send Access grant when client requests resource for the first time
#   In order to provide an Access token to the client
#   As a resource server
#   I want to send an Access grant to the client
#

  @wip
  Scenario: Client requests Access token exchange code
    Given a registered application with client_id="123456"
    # And I am not logged in
    And I go to "/user/login?client_id=YOUR_APP_ID&redirect_uri=YOUR_URL"
    When I fill in "email" with "marvin@tty.nl"
    And I fill in "password" with "123456"
    And I press "Login"
    Then I should be redirected to "user/validate"
    When I press "Allow"
    Then a permission should exist
    
    
