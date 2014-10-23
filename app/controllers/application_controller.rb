class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def require_login
    if logged_in?
      true
    else
      redirect_to login_path
      false
    end
  end
end
