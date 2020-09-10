class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comment = post.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @post = @comment.post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  private
  def comment_params
    params.required(:comment).permit(:context, :post_id, :user_id, )
  end

end
