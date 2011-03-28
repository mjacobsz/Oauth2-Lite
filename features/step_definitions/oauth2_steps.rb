### GIVEN ###
Given /^I log in as "(.*)" with email "(.*)" and with password "(.*)"$/ do |name, email, password| 
  Given "user \"#{name}\" with email \"#{email}\" and password \"#{password}\" exists"
  When "I go to \"/user/login\""
  And "I fill in \"email\" with \"#{email}\""
  And "I fill in \"password\" with \"#{password}\""
  And "I press \"Login\""
end

Given /^I am not logged in$/ do 
  # Nothing
end

Given /^a registered application with client_id="([^"]*)"$/ do |arg1|
  # TODO Create an application
end

Given /^user "(.*)" with email "(.*)" and password "(.*)" exists$/ do |username, email, password|
  @given_user = User.new({:name => username, :email => email, :password => password})
  @given_user.save
end

Given /^client with name "(.*)", client_id "(.*)" and client_secret "(.*)" exists$/ do |name, id, secret|
  @given_client = Client.new({:name => name, :client_id => id, :client_secret => secret})
  @given_client.save
end

Given /^user has logged in to the client$/ do 
  # Nothing
end

### WHEN ###
When /^I do a custom visit to (.*)$/ do |params|
  visit params
end

When /^I want to change a cookie$/ do
  cookies = Capybara.current_session.driver.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  cookies[:some_key] = "some_value"
end

# Do the actual 'POST' here?
When /^the client request an access token with parameters: grant_type: "(.*)", client_id: "(.*)", client_secret: "(.*)", username: "(.*)" and password "(.*)"$/ do |gt, cid, csecret, username, password|
      @provided_gt = gt
      @provided_cid = cid
      @provided_csecret = csecret
      @provided_username = username
      @provided_password = password
end

### THEN ###
Then /^I should be redirected to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^a permission should exist$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^params\[:([a-z]*)\] should be '([a-z]*)'$/ do |key, value|
  params[key].should value
end

Then /^the given parameters are valid$/ do
  @provided_gt == "password" &&
  @provided_cid = @given_client.client_id &&
  @provided_csecret = @given_client.client_secret &&
  @provided_username = @given_user.name &&
  @provided_password = @given_user.password
end