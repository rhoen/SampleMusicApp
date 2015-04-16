class SessionsController < ApplicationController
  #get request to session/new returns log in page
  def new
    @user = User.new
    render :log_in
  end

  #post to session runs create action
  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token

      redirect_to user_url(@user)
    else
      #flash errors? put errors in the view?
      render :log_in
    end
  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])
    if @user
      @user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_sessions_url
    else
      raise "logout failure"
    end
  end


end
