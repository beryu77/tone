class CommentLikesController < ApplicationController
  before_action :logged_in_user

  def create
    @comment = Comment.find(params[:comment_id])
    comment_like = current_user.comment_likes.build(comment_id: params[:comment_id])
    comment_like.save
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    comment_like = CommentLike.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    comment_like.destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
