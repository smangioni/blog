class SessionsController < ApplicationController
  def new
  end
  
  def create
    session[:user_id] = User.authenticate(user_params[:email], user_params[:password_hash])

    redirect_to root_path
  end
  
  def delete
    session[:user_id] = nil #Remove the user_id on the session

    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end
end
