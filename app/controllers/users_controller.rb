class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.order(created_at: :desc)
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
  def user_params
    params.require(:user).permit(
        :username, :name, :website, :bio, :email, :phone, :gender, :image)
  end

end
