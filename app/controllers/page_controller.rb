class PageController < ApplicationController
  def home
    @posts = Post.all.order(created_at: :desc)
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
