class LikesController < ApplicationController
  before_action :authenticate_user!, :find_post

  def create
    @like = Like.create(likes_params)
      if @like.save
        redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      end
  end

  def destroy
    liked = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if liked.present?
      if liked.destroy
        flash.now[:notice] = 'Successfully deleted Like!'
        redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      else
        flash[:alert] = 'Error delete Like!'
      end
    end
  end

  private
  def likes_params
    params.permit(:user_id, :post_id)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
