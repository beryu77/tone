class SilverPrizesController < ApplicationController
  before_action :logged_in_user

  def create
    @silver = current_user.silver_prizes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @silver = GoldPrize.find_by(post_id: params[:post_id], user_id: current_user.id)
    @silver.destroy
    redirect_back(fallback_location: root_path)
  end
end
