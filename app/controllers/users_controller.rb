class UsersController < ApplicationController
  before_action :load_user

  def show
    @posts = @user.posts.order(created_at: :desc)
    @follower = @user.followers
    @followings = @user.followings
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to edit_user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(
        :username, :name, :website, :bio, :email, :phone, :gender, :image)
  end

  def load_user
    @user = User.find(params[:id])
  end
end
