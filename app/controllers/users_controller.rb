class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id #get up the session

    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end
end
