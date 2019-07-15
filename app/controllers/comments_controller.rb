class CommentsController < ApplicationController
  require 'pry'
  # binding.pry
  # validates :title, presence: true


  def index
    if params[:post_id]
      @comments = Post.find(params[:post_id]).comments
    else
      @comments = Comment.all
    end
    # @comments = Comment.all
  end

  def new
    # if params[:post_id]
    #
    # else
    #   @comment = Comment.new(comment_params)
    # end
    # @comment = Comment.new(comment_params)
    @comment = Comment.new(post_id: params[:post_id])
    # binding.pry
  end
#
# validations with form_for lab/lesson. it shows how to build out the
# create action with syntax and errors for debugging
# if you can have it so errors will show up on the form, it'll be simpler to debug
# with more feedback.
# and also check out the build method current_user.comments.build but it d
# doesn't save
  def create
    # binding.pry
    # require_login
    # @comment = Comment.create(comment_params)
    # # @comment = Comment.create
    # binding.pry
    # redirect_to comment_path(@comment)
    require_login
    # binding.pry
    # someone is logged in, but it can't find them with current_user?
    # if @user = User.find_by_id(session[:user_id])
    # if current_user
      @user = current_user
      # binding.pry
      @comment = @user.comments.build(
        :title => comment_params[:title],
        :content => comment_params[:content],
        :post_id => comment_params[:post_id],
        # :user_id => @user.id
        # using the build line and the user_id line above is redundant
        )
      # else
        # redirect_to signin_path
        # return
    # end
    # @comment = Comment.new(comment_params)
    # binding.pry
    if @comment.save
      redirect_to comment_path(@comment)
      # return
    else
      render :new
    end
  end



  def show
    @comment = Comment.find_by_id(params[:id])
  end


  private

  def comment_params(*args)
    # binding.pry
    params.require(:comment).permit(:title, :content, :post_id, :user_id)
  end

end
