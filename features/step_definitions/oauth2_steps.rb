# Given /^a client exists$/ do
#   client_id = 1337
#   client_secret = "super_secret_string"
#   @client = OAuth2::Client.new(client_id, client_secret)
# end
# 
# Then /^I am happy$/ do
#   "I am!"
# end

Given /^I am (not)? logged in$/ do |no|
  # puts "XXXXXXXXXXXXXXXXXXXX #{no} XXXXXXXXXXXXXXXXXXXX"
  # Nothing
end

Given /^a registered application with client_id="([^"]*)"$/ do |arg1|
  # TODO Create an application
end

Given /^user "(.*)" with email "(.*)" and password "(.*)" exists$/ do |username, email, password|
  User.new({:name => username, :email => email, :password => password}).save
end

Then /^I should be redirected to "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^a permission should exist$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^params\[:([a-z]*)\] should be '([a-z]*)'$/ do |key, value|
  params[key].should value
end

Then /^It must be spring$/ do
  true
end