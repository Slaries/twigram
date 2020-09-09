class FollowsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @follower = @user.followers
    @followings = @user.followings
  end
  def create
    follower_user = current_user
    following_user = User.find(params[:following_id])
    @follow = Follow.create(follower: follower_user, following: following_user)
    if @follow.valid?
      @follow.save
    end
    if @follow.save
      redirect_to user_followers_path(following_user), flash: {success:"You follow now"}
    else
      redirect_to user_path(following_user), flash: {alert: "Some error"}
    end
  end
end
