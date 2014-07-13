class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: user_params[:email], password_hash: user_params[:password_hash]).first
    session[:user_id] = @user.id #Save the user_id on the session
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
