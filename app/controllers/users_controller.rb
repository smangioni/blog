class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    @user.password_hash = Digest::MD5.digest(user_params[:password_hash]).force_encoding("utf-8")

    @user.save
    redirect_to root_path
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_hash)
  end
end
