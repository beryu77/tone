class BestPhotosController < ApplicationController
  before_action :logged_in_user

  def create
    @best_photo = current_user.best_photos.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @best_photo = BestPhoto.find_by(post_id: params[:post_id], user_id: current_user.id)
    @best_photo.destroy
    redirect_back(fallback_location: root_path)
  end
end
