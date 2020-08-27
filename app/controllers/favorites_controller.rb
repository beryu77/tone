class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    respond_to do |format|
      format.html { redirect_to request.referer || root_url }
      format.js
    end
  end
end
