class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :require_login

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_user
    login_cheat!
    @current_user = User.find_by(email: session[:current_user_email]) || NullUser.new
  end

  def require_login
    redirect_to login_path unless @current_user.is_a?(User)
  end

  def login_cheat!
    session[:current_user_email] = User.first.email
  end
end
