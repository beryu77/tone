class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
    @post.create_notification_like(current_user)
  end
end
