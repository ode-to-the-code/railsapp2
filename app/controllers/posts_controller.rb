class PostsController < ApplicationController
  before_action :require_login


  def index
    if params[:user_id]
      @user = current_user
      # binding.pry
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
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    if !@post = Post.find_by_id(params[:id])
       redirect_to root_path
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    # binding.pry
    if @post.user_id == current_user.id
        @post.update(title: params[:post][:title], content: params[:post][:content])
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to posts_path
  end



  private

    def post_params(*args)
      params.require(:post).permit(:title, :content, :user_id)
    end


end
