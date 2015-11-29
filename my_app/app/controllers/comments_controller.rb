class CommentsController < ApplicationController

  def index
    @comments = Comment.all.order('created_at DESC')
    @comment = Comment.new
  end

  def new
    if current_customer
      @comment = Comment.new
    else
      flash[:notice] = "Please sign in order to comment"
      redirect_to login_path
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def show
    @customer = Customer.all
    @comment = Comment.find params[:id]
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.customer = current_customer
    redirect_to comments_path 
  end

  def update
    if current_customer
      @comment = Comment.find params[:id]
      @comment.update(comment_params)

      redirect_to comments_path
    else
      render :edit
    end
  end

  def destroy
    if current_customer
        @comment = Comment.find params[:id]
        @comment.destroy
        flash[:notice] = "Your comment has been deleted sucker! Sike! Nah, it's gone though."
        redirect_to comments_path
    else
     redirect_to welcome_path(@welcome)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
