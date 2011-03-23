def do_request(http_method, request_uri, body = '')
  http_method.downcase!
  request_uri = patch_request(http_method, request_uri)

  body = body.to_json if body.is_a? Hash

  # E.g. post("/path")
  send(http_method, request_uri, body)
end

def json_request(method, request_uri, body = '')
  header('Content-Type', 'application/json')
  header('Accept', 'application/json')
  do_request(method.to_s, request_uri, body)
end

Given /^I '(.+)' to '(.+)'$/ do |http_method, request_uri|
  json_request(http_method, request_uri)
end

Given /^I '(.+)' to '(.+)' with:$/ do |http_method, request_uri, body|
  json_request(http_method, request_uri, body)
end

Then /^the response code should be '(.+)'$/ do |response_code|
  unless response.status == response_code.to_i
    Then "show me the response"
  end
  self.response.status.should == response_code.to_i
end

Then /^I should get an empty '(.+)' response$/ do |response_code|
  self.response.status.should == response_code.to_i
  self.response.body.should == "{}"
end

Then /^show me the response$/ do 
  puts "Got the following response:"
  puts response.body.inspect
end

Then /^(?:I |)debug$/i do
  debugger
end

Then /^I should get a response '(\d+)' with the following json:$/ do |status_code, expected_json_body|
  Then "the response code should be '#{status_code}'"
  # HAX We also have to remove the asset timestamp for now
  retrieved_json = JSON.parse(self.response.body)
  expected_json = JSON.parse(expected_json_body)

  retrieved_json.should == expected_json
end