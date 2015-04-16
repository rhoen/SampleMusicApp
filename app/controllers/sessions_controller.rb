class SessionsController < ApplicationController
  #get request to session/new returns log in page
  def new
    @user = User.new
    render :log_in
  end

  #post to session runs create action
  def create
    user = User.find_by_credentials(params[:user][:email],params[:user][:password])
  
    if user.nil?
      flash[:errors] = ["incorrect email/password combination"]
      render :log_in
    else
      user.reset_session_token!
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    end
  end

  def destroy
    user = User.find_by(session_token: session[:session_token])
    if user.nil?
      raise "logout failure"
    else
      user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_sessions_url
    end
  end
end
