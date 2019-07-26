class PostsController < ApplicationController
  before_action :require_login
  
  def index
    if params[:user_id]
      @user = current_user
      binding.pry
      @posts = @user.posts
    else
      @posts = Post.all
    end
  end

  def new
    require_login
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.user_id = current_user.id
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    if !@post = Post.find_by_id(params[:id])
       redirect_to root_path
    else
      @post.user_id = current_user.id

    end
  end

  private

    def post_params(*args)
      params.require(:post).permit(:title, :content, :user_id)
    end


end
