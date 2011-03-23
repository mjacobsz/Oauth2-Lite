class UserController < ApplicationController
  #verify :params => [:client_id, :redirect_uri], :render => {:action => "render_missing_info"}, :only => :login
  #before_filter :require_obligatory_params, :only => [:login, :validate]
  
  def login
    @location_to_post = "/user/validate"

    #debugger

    @location_to_post += "?get_back_to=#{params[:get_back_to]}" if params[:get_back_to]
    
    #debugger
    
    foo = "bar"
    # session[:redirect_after_login] = params[:redirect_after_login] if params[:redirect_after_login] 
  end
  
  def validate
    # debugger
    unless @user = User.find_by_email(params[:email])
      flash[:error] = "No user known with entered email address"
      redirect_to :action => "login" and return
    end
    
    unless @user.password == params[:password]
      flash[:error] = "Entered password is incorrect"
      redirect_to :action => "login" and return
    end
    
    session[:current_user] ||= @user.id
    session[:logged_in] ||= true
    
    if params[:get_back_to]
      redirect_to params[:get_back_to]
    #if session[:redirect_after_login]
    #  redirect_to session[:redirect_after_login]
    else
      render "logged_in.html"
    end
  end
end
