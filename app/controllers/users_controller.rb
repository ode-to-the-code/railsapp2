# require 'pry'

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # hello
    # raise params.inspect
    @user = User.create(user_params)
    session[:user_id] = @user.id
    # raise session.inspect
    redirect_to user_path(@user)
  end

  def show
    binding.pry
    # raise params.inspect
    @user = User.find_by_id(params[:id])
  end


  private

  def user_params(*args)
    params.require(:user).permit(:name, :password, :admin)
  end

end
