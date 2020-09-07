class FollowersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @follower = @user.followers
  end


end
