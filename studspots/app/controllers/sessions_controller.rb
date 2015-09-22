class SessionsController < ApplicationController
  
  def create
    user = User.find_by({user_name: params[:user_name]})
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to spots_path
    else
      flash[:error] = "Incorrect user Name or Password"
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end