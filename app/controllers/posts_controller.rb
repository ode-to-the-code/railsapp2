class PostsController < ApplicationController
# require 'pry'
  # validates :title, presence: true
  # validate :title, presence: true


  def index
    if params[:user_id]
      @posts = User.find_by_id(params[:user_id]).posts
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
      return
    else
      render :new
      return
    end
  end

  def show
    # require_login
    # binding.pry
    if @post = Post.find_by_id(params[:id])
      # binding.pry
       @post.user_id = current_user.id
       render :show
       return
    else
       redirect_to root_path and return
    end
    # @post.user_id = current_user.id

  end

  private

    def post_params(*args)
      # binding.pry
      params.require(:post).permit(:title, :content, :user_id)
    end


end
