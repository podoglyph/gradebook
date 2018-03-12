class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :render_403

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def render_403
    render file: 'public/403', status: 403
  end

end
