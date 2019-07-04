class ApplicationController < ActionController::Base


    helper_method :current_user, :require_login
    # helper_method :current_user


    def require_login
      # binding.pry
      # redirect_to '/' unless session.include? :user_id && current_user
      redirect_to '/' unless session.include?(:user_id) && !!current_user
      # it may have grouped the 'and' and the paranetheses
      # think about what will happen if they're not logged in. you might
      # look into the and return thing.
    end

    # def current_user
    #   binding.pry
    #   @user = User.find_by_id(session[:user_id])
    # end

    #test example from one of the walkthroughs
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      # binding.pry
    end


end
