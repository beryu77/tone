class ContestPostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @contest_posts = ContestPost.page(params[:page])
  end

  def new
    @contest_post = ContestPost.new
  end

  def create
    @contest_post = current_user.contest_posts.build(contest_params)
    if @contest_post.save
      flash[:success] = "投稿が完了しました！"
      redirect_to root_path
    else
      redirect_to new_contest_post_path
    end
  end

  def show
    @contest_post = ContestPost.find(params[:id])
  end

  private

  def contest_params
    params.require(:contest_post).permit(:image, :title, :caption, :location, :equipment)
  end
end 
