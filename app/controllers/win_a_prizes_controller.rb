class WinAPrizesController < ApplicationController
  before_action :logged_in_user

  def create
    @win = current_user.win_a_prizes.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @win = WinAPrize.find_by(post_id: params[:post_id], user_id: current_user.id)
    @win.destroy
    redirect_back(fallback_location: root_path)
  end
end
