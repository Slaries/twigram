class PostsController < ApplicationController
  before_action :load_user

  def index
    # @post = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash.now[:success] = "Post added"
      redirect_to user_path(current_user)
    else
      render 'new'
    end

  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    # if @post.update(postedit_params)
    #   flash[:notice] = "Successfully updated post!"
    #   redirect_to user_path(current_user)
    # else
    #   flash[:alert] = "Error updating post!"
    #   render :edit
    # end

  end

  def destroy
  #   @post = Post.find(params[:id])
  #   if @post.destroy
  #     flash.now[:notice] = "Successfully deleted post!"
  #     redirect_to user_path(current_user)
  #   else
  #     flash[:alert] = "Error updating post!"
  #   end
  end
  # def postedit_params
  #   params.require(:post).permit(:content, :user_id, :remove_image)
  # end
  #
  def post_params
    params.require(:post).permit(:content,  :user_id)
  end
  def load_user
    @user = User.find(params[:user_id])
  end

end
