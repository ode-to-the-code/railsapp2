class SessionsController < ApplicationController

  def new
    @user = User.new
    # binding.pry

  end

  def create
    binding.pry

    if @user = User.find_by_id(params[:user][:name])
      # binding.pry
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/'
      end

    end
    redirect_to '/'
  end


  def destroy
    session.clear
    redirect_to '/'
  end

end
