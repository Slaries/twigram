class UsersController < ApplicationController
  def show

  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    current_user.update(user_params)
    redirect_to edit_user_path(current_user)
  end
  def user_params
    params.require(:user).permit(
        :username, :name, :website, :bio, :email, :phone, :gender)
  end

end
