class ApplicationController < ActionController::Base


    helper_method :current_user, :require_login

    def require_login
      # binding.pry
      # redirect_to '/' unless session.include? :user_id && current_user
      redirect_to '/' unless session.include?(:user_id) && !!current_user
      # it may have grouped the 'and' and the paranetheses
      # think about what will happen if they're not logged in. you might
      # look into the and return thing.
    end

    def current_user
      @user = User.find_by_id(session[:user_id])
    end


end
