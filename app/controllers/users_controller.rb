class UsersController < ApplicationController
  #new action called from a get request to /users/new
  #responds by sending a form to create a new user
  def new
    @user = User.new
    render :new
  end

  #create action called from a post request to /users
  #attempts to create a new user using the params that accompanied
  #the post request. Params must be whitelisted
  def create
    @user = User.new(user_params)
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
