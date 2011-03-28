class Oauth2Controller < ApplicationController
  before_filter :require_obligatory_params, :only => [:authenticate]
  
  def authenticate
    # Response type must be 'code'
    if session[:response_type] != 'code'
      flash[:error] = "Wrong request type"
      redirect_to :action => 'error'
      return
    # Given client id should correspond to an actual existing client
    elsif not @client = Client.find_by_client_id(session[:client_id])
      flash[:error] = "No client found with given client id"
      redirect_to :action => 'error'
      return
    # Send user to login screen when she's not logged in yet AND provide a 'callback' url
    elsif not session[:logged_in]
      redirect_to '/user/login?get_back_to=' + request.request_uri.split('?')[0]
    end
    
    @client
  end
  
  def require_obligatory_params
    session[:response_type] ||= params[:response_type]
    session[:client_id] ||= params[:client_id]
    session[:redirect_uri] ||= params[:redirect_uri]

    redirect_to "/oauth2/missing_info" unless (session[:response_type] and session[:client_id] and session[:redirect_uri])
  end
  
  def resource_owner_password_credentials
    unless (params[:grant_type] && params[:client_id] && params[:client_secret] && params[:username] && params[:password])
      redirect_to :action => "error" # TODO: Implement a better way of handling this
      return
    end
  
    unless params[:grant_type] == "password"
      flash[:error] = "Granttype should be set to password. Perhaps you made a mistake?"
      redirect_to :action => "error"
      return
    end

    unless client = Client.find_by_client_id(params[:client_id])
      flash[:error] = "No known client with provided client ID"
      redirect_to :action => "error"
      return
    end
    
    unless client.client_secret == params[:client_secret]
      flash[:error] = "Client secret does not match"
      redirect_to :action => "error"
      return
    end
    
    unless user = User.find_by_name(params[:username])
      flash[:error] = "No user known with entered email address"
      redirect_to :action => "error"
      return
    end
    
    unless user.password == params[:password]
      flash[:error] = "Username / password mismatch"
      redirect_to :action => "error"
      return
    end
    
    # Phew, well if we made to here, then everyting is OK, so create and return the token
    new_token_entry = Token.new({
      :client_id => client.client_id,
      :user_id => user.id,
      :access_token_exchange_code => nil,
      :access_token_exchange_code_issue_date => nil,
      :access_token => 'abconetwothree',
      :refresh_token => 'doremisayinonetwothree',
      :expiry_date => DateTime.now + 1.hour
    })

    new_token_entry.save
 
    render :json => new_token_entry
    
    # respond_to do |format|
    #    format.json
    #  end
    
  end
  
  
  def redirect_uri_test
  end
  
  def error
  end
  
  def missing_info
  end
end
