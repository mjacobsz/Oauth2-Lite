class TokenController < ApplicationController

  def authenticated
    unless session[:logged_in]
      redirect_to '/422.html'
      return
    end
    
    redirect_uri = session[:redirect_uri]
    authorizion_grant = "granted"
    to_be_redirected_to = "http://#{redirect_uri}?code=#{authorizion_grant}"

    # NOTE: Should this be in a seperate (standard) 'create' method? But then how do we pass parameters to it? 
    new_token_entry = Token.new({
      :client_id => session[:client_id],
      :user_id => session[:current_user],
      :access_token_exchange_code => authorizion_grant,
      :access_token_exchange_code_issue_date => DateTime.now,
      :access_token => 'abconetwothree',
      :refresh_token => 'doremisayinonetwothree',
      :expiry_date => DateTime.now + 1.hour
    })
    
    new_token_entry.save
    
    redirect_to to_be_redirected_to
  end
end
