class PostsController < ApplicationController
# require 'pry'


  def index
    @posts = Post.all
    # @posts = "glarg"
  end

  def new
    # binding.pry
    # byebug
    binding.pry
    require_login
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to post_path(@post)
  end

  def show
    require_login
    @post = Post.find_by_id(params[:id])
  end

  private

    def post_params(*args)
      params.require(:post).permit(:title, :content)
    end

end
