class GoldPrizesController < ApplicationController
  before_action :logged_in_user

  def create
    @gold = current_user.gold_prizes.create(contest_post_id: params[:contest_post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @gold = GoldPrize.find_by(contest_post_id: params[:contest_post_id], user_id: current_user.id)
    @gold.destroy
    redirect_back(fallback_location: root_path)
  end
end
