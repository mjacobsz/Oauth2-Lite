# GIVEN
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
  User.new({:name => username, :email => email, :password => password}).save
end

Given /^client with name "(.*)", client_id "(.*)" and client_secret "(.*)" exists$/ do |name, id, secret|
  Client.new({:name => name, :client_id => id, :client_secret => secret}).save
end

# WHEN
When /^I do a custom visit to (.*)$/ do |params|
  visit params
end

When /^I want to change a cookie$/ do
  cookies = Capybara.current_session.driver.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  cookies[:some_key] = "some_value"
end

# THEN
Then /^I should be redirected to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^a permission should exist$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^params\[:([a-z]*)\] should be '([a-z]*)'$/ do |key, value|
  params[key].should value
end