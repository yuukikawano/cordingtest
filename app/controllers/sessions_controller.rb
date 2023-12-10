class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.name =="adminuser" 
        redirect_to admin_users_path
      else   
        redirect_to recordattends_path
      end
    else   
      render 'new' 
    end 
  end 

  def destroy 
    log_out if logged_in? 
    redirect_to recordattends_path
  end
end
