class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  def current_user
    return nil if @user.nil?
    User.find_by(session_token: @user.session_token)
  end
  def logged_in?
    # @user = User.find_by(session_token: session[:session_token])
    current_user ? true : false
  end
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
