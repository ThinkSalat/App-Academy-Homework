class ApplicationController < ActionController::Base
  helper_method :auth_token, :current_user, :logged_in?

  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token!
  end
end
