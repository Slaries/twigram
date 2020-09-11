class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = @posts.order(created_at: :desc)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_post_path(@comment.user_id,@comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  private
  def comment_params
    params.required(:comment).permit(:context, :post_id, :user_id)
  end
end
