
class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # binding.pry
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def show
    # binding.pry
    # raise params.inspect
    # require_login
    # binding.pry
    if  @user = User.find_by_id(params[:id])
      render :show
      return
    end
      redirect_to users_path
      return
  end

  def created_today
    # binding.pry
    # think about why the below line is coming back nil. we made_today# and
    # an instance, so there should be that 'tom' that we made.
    # remember to keep the views lean and keep the logic in the model and
    # use it in the controller.
    @recent_users = User.made_today?
  end

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id].clear
    redirect_to '/'
  end


  private

  def user_params(*args)
    params.require(:user).permit(:name, :password, :admin, :uid)
  end

end
