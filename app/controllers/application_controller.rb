class ApplicationController < ActionController::Base

    helper_method :current_user, :require_login
    before_action :require_login

    def require_login
      redirect_to '/' unless session.include?(:user_id) && !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end


end
