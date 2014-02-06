class SessionsController < ApplicationController
def new
end
  
def create
 user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect_to users_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render 'new'
  end
end

def destroy
  session[:user_id] = nil
  redirect_to users_path, :notice => "Logged out!"
end
end