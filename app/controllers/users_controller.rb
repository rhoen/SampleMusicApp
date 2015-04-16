class UsersController < ApplicationController

  #new action called from a get request to /users/new
  #responds by sending a form to create a new user
  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end
  #create action called from a post request to /users
  #attempts to create a new user using the params that accompanied
  #the post request. Params must be whitelisted
  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to user_url(@user) #will call the show action for the user view
    else
      #flash errors? 
      render :new
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
