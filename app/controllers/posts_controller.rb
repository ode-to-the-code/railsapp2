class PostsController < ApplicationController
# require 'pry'
  # validates :title, presence: true
  # validate :title, presence: true


  def index
    if params[:user_id]
      @user = current_user
      binding.pry
      @posts = @user.posts
    else
      @posts = Post.all
    end
    # @posts = "glarg"
  end

  def new
    # binding.pry
    # byebug
    # binding.pry
    # require_login
    @post = Post.new
    # binding.pry
  end

  def create
    # require_login
    @post = Post.new(post_params)
    # if @post.valid?
    if @post.save
      @post.user_id = current_user.id
      redirect_to post_path(@post)
    else
      render :new
# if you had a return here it couldn't hit 33 and 37. but it's more proper to have them in one if/else,
# since you cna't hit both an if and an else. it can't have the option of hitting both even if it
# doesn't happen in a particular case
    end
  end

  def show
    # require_login
    # binding.pry
    if !@post = Post.find_by_id(params[:id])
      # binding.pry
       redirect_to root_path
    else
      @post.user_id = current_user.id

    end
    # @post.user_id = current_user.id

  end

  private

    def post_params(*args)
      # binding.pry
      params.require(:post).permit(:title, :content, :user_id)
    end


end
