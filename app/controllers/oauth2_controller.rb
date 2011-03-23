class Oauth2Controller < ApplicationController
  #verify :params => [:client_id, :redirect_uri], :render => {:action => "render_missing_info"}, :only => :login
  before_filter :require_obligatory_params, :only => [:authenticate]
  
  # Authenticate client in order to gain an authorization code
  #
  # Next values are required for this method: 'response_type', 'client_id' and 'redirect_uri'
  #
  # Check if user is logged in
  # If not, redirect to user login and let user login
  # Show form to user: User should enter 'allow' or 'don't allow'
  # After this, redirect user to redirect_uri
  def authenticate
    
    #debugger
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
      # session[:redirect_after_login] = request.request_uri
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
  
  def error
  end
  
  def missing_info
  end
end