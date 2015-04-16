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
    session[:session_token] = @user.session_token
    if @user.save
      redirect_to user_url(@user) #will call the show action for the user view
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    #render :show
  end

end
