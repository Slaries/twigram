class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings
  end
end
