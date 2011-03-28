class UserController < ApplicationController  
  def login
    @location_to_post = "/user/validate"
    @location_to_post += "?get_back_to=#{params[:get_back_to]}" if params[:get_back_to]
  end
  
  def validate
    unless @user = User.find_by_email(params[:email])
      flash[:error] = "No user known with entered email address"
      redirect_to :action => "login" 
      return
    end
    
    unless @user.password == params[:password]
      flash[:error] = "Entered password is incorrect"
      redirect_to :action => "login"
      return
    end
    
    session[:current_user] ||= @user.id
    session[:logged_in] ||= true
    
    if params[:get_back_to]
      redirect_to params[:get_back_to]
    else
      render "logged_in.html"
    end
  end
end
