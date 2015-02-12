class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?

  def current_user
    return nil unless session[:token]
    @cu ||= User.find_by(:session_token => session[:token])
  end

  def sign_in(user)
    user.reset_session_token!
    session[:token] = user.session_token
  end

  def signed_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless signed_in?
  end

  def admin?
    redirect_to new_session_url unless current_user && current_user.is_admin?
  end


end
