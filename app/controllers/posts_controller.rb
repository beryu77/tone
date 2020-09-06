class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.page(params[:page])
  end

  def timeline
    @user = User.find_by(id: current_user.id)
    @users = User.order(id: :DESC).page(params[:page]) .per(5)
    @timeline_posts = current_user.timeline.page(params[:page])
  end

  def popular
    @popular_posts = Post.joins(:likes).group(:post_id).order('count(likes.user_id) desc').page(params[:page])
  end

  def feature
    @feature_posts = Post.joins(:likes).group(:post_id).where(created_at: 1.week.ago.beginning_of_day..Time.current.end_of_day).order('count(likes.user_id) desc').limit(7)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました！"
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @comment = @post.comments.build(user_id: current_user.id) if current_user
    @like = Like.new
    @comment_like = CommentLike.new
    @favorite = Favorite.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "投稿の編集が完了しました"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to root_path
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