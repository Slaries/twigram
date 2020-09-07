class PostsController < ApplicationController
  before_action :load_user

  def index

    @posts = @user.posts.order(created_at: :desc)
    @follower = @user.followers
    @followings = @user.followings

  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if @post.valid?
      @post.image_derivatives! if @post.image_changed?
      @post.save
    end
    if @post.save
      redirect_to user_post_path(@user,@post), flash: {success:"Post added"}
    else
      render 'new', flash: {alert: "Some error"}
    end

  end

  def edit
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = @user.posts.find(params[:id])
     if @post.update(post_params)
       flash[:notice] = "Successfully updated post!"
       redirect_to user_post_path(@user,@post)
     else
       flash[:alert] = "Error updating post!"
       render :edit
     end

  end

  def destroy
    @post = @user.posts.find(params[:id])
    if @post.destroy
      flash.now[:notice] = "Successfully deleted post!"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Error updating post!"
    end
  end
  def image_params
    params.require(:post).permit(:content, :image, :remove_image)
  end

  def post_params
    params.require(:post).permit(:content, :image, :user_id)
  end
  def load_user
    @user = User.find(params[:user_id])
  end

end
