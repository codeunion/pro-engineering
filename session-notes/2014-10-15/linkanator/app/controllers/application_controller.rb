class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Expose current_user and logged_in? methods as view helpers
  helper_method :current_user, :logged_in?

  def current_user
    return nil if session[:user_id].blank?

    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def login!(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout!
    @current_user = nil
    session.delete(:user_id)
  end

  def redirect_if_logged_in!(url = root_url)
    redirect_to(url) if logged_in?
  end
end
