class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user
  protected # prevents method from being invoked by a route
  def set_current_user
    # we exploit the fact that the below query may return nil
    @current_user ||= User.where(:id => session[:user_id])
    redirect_to login_path and return unless @current_user
  end
end
