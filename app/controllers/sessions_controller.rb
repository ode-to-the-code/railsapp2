class SessionsController < ApplicationController

  def new
    @user = User.new
    # binding.pry

  end

  def create
    # binding.pry
    if auth
      # check out the syntax for this block, but the if statement should be accssible now
       @user = User.find_or_create_by(uid: auth['uid'])
      #  @user.each do |u|
       binding.pry
       @user.name = auth['info']['name']
      #  @user.email = auth['info']['email']
      #  @user.image = auth['info']['image']

      # end
    # binding.pry
  elsif @user = User.find_by_id(params[:user][:name])
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


#   def create
#   # binding.pry
#   # user = User.find_by(id: params[:id])
#   @user = User.find_or_create_by(uid: auth[:uid]) do |u|
#     # binding.pry
#     u.name = auth['info']['name']
#     # u.email = auth['info']['email']
#     # u.image = auth['info']['image']
#   end
#   session[:user_name] = @user.id
#
#   redirect_to 'welcome/home'
#
# end


# SecureRandom is going to make a random password. This way they don't have to
# enter theirs, since using OmniAuth is supposed to not have to remember another password anyway.
# Apparently the most common issue with students learning omniauth is forgetting to add a
# a password, and that seems to be what happened to me with the Facebook problem before.
# it looks like it worked, but the user never logs in.
# The next step was to set the session[:user_id]. To me it was empty, with no id.
# because if you don't set the password, it won't assign a user ID.

# binding.pry
# the point of the do block here is so that you're only 'finding' using the
# email attribute, but then you're able to set using other attributes also.
# it does the same thing as if you were doing @user and setting the attrutes
# underneath.
  def omniauth
    # byebug
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
      # u.password = SecureRandom.hex
      u.name = "arbitrary name"
      u.password = "password"
    end

    session[:user_id] = @user.id
    redirect_to user_path(@user)

    # this method will look in our database to find any uer with that email. and
    # if someone exists who does have that email, it will use that first result. or if
    #  nobody does, it will initialize one. the difference between find and create by is that that
    #  one saves in one step as well, much like new vs create.
    # User.where(email: auth[:email]).first_or_initialize
  end


  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  # work on creating the name and so on for the user
  # and don't forget to make a password

end
#
#
# def create 
#   @user = User.find_or_create_by(uid: auth['uid']) do |new_user| 
#     new_user.name = auth['info']['name'] 
#     new_user.email = auth['info']['email'] 
#     new_user.image = auth['info']['image'] 
#   end 
#   # consider how to set a default value for uid, since users logggin in with the
#   # regular login route aren't going t ohave a uid.
#
#   session[:user_id] = @user.id      
#
# end
