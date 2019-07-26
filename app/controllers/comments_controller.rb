class CommentsController < ApplicationController
  require 'pry'


  def index
    if params[:post_id]
      @comments = Post.find(params[:post_id]).comments
    else
      @comments = Comment.all
    end
  end

  def new

    @comment = Comment.new(post_id: params[:post_id])

  end

  def create
    require_login

      @user = current_user
      @comment = @user.comments.build(
        :title => comment_params[:title],
        :content => comment_params[:content],
        :post_id => comment_params[:post_id],
        )
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end



  def show
    @comment = Comment.find_by_id(params[:id])
  end


  private

  def comment_params(*args)
    params.require(:comment).permit(:title, :content, :post_id, :user_id)
  end

end
