class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.page(params[:page]).per(PER)
  end

  def popular
    @popular_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました！"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption, :location, :equipment)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end