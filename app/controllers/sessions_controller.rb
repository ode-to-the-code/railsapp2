class SessionsController < ApplicationController

  def new
    @user = User.new
    # binding.pry

  end

  def create
    # binding.pry
    if @auth
       @user = User.find_or_create_by(uid: auth['uid']) do
       @user.do |u|
      #  binding.pry
       u.name
      end
    end

    binding.pry
    if @user = User.find_by_id(params[:user][:name])
      # binding.pry
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user) and return
      else
        redirect_to '/' and return
      end

    end
    redirect_to '/' and return
  end


  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth']
  end

end
