class ContestsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @contests = Contest.page(params[:page])
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = current_user.contests.build(contest_params)
    if @contest.save
      flash[:success] = "コンテストが作成できました！"
      redirect_to @contest
    else
      redirect_to new_contest_path
    end
  end

  def show
    @contest = Contest.find(params[:id])
  end

  def edit 
    @contest = Contest.find(params[:id])
  end

  def update 
    @contest = Contest.find(params[:id])
    if @contest.update_attributes(contest_params)
      flash[:success] = "コンテストの編集が完了しました"
      redirect_to @contest
    else
      render "edit"
    end
  end

  def destroy
    @contest.destroy
    flash[:success] = "コンテストを削除しました"
    redirect_to contests_path
  end

  private

  def contest_params
    params.require(:contest).permit(:title, :main, :condition, :image)
  end

  def correct_user
    @contest = current_user.contests.find_by(id: params[:id])
    redirect_to root_url if @contest.nil?
  end

end