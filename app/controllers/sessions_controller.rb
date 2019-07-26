class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:omniauth, :destroy, :new, :create]

  def new
    @user = User.new
  end

  def create
    if auth
       @user = User.find_or_create_by(uid: auth['uid'])
       @user.name = auth['info']['name']
  elsif @user = User.find_by_id(params[:user][:name])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "You've signed in!"
        redirect_to user_path(@user) and return
      else
        flash.now[:error] = "You didn't sign in successfully. Check your data!"
        render :new
      end

    end
  end


  def omniauth
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
      u.name = auth[:info][:name]
      u.password = SecureRandom.hex
    end

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
