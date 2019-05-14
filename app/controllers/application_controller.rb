class ApplicationController < ActionController::Base


    helper_method :current_user

    def require_login
      redirect_to '/' unless session.include? :user_id
    end

    def current_user
      @user = User.find(session[:user_id])
    end


end
