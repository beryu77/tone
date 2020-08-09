class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :target_post

  def create
    current_user.like(@post)
  end

  def destroy
    current_user.unlike(@post)
  end

  private

  def target_post
    @post = Post.find(params[:post_id])
  end
end