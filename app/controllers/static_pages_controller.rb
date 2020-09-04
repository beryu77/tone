class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @timeline_posts = current_user.timeline.page(params[:page])
      @timeline_posts = @timeline_posts.includes(:user)
      @posts = Post.page(params[:page])
      @posts = @posts.includes(:user)
      redirect_to timeline_posts_path
    else
      @posts = Post.page(params[:page])
      @posts = @posts.includes(:user)
      redirect_to posts_path 
    end
  end

  def about
  end
end
