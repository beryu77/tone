class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントしました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'コメントできませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'コメントが削除されました'
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
