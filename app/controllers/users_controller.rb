require 'simplecov'
SimpleCov.start 'rails'
class UsersController < ApplicationController
  before_action :load_user
  def show
    # @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @follower = @user.followers
    @followings = @user.followings
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      flash[:notice] = "Edit Profile"
      # redirect_to edit_user_path(@user)
    else
      flash[:alert] = "Denided!"
      redirect_to user_path(@user)
    end
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
