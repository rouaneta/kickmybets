class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    @participation = Participation.new
  end

  def ranking
    @contest = Contest.find(params[:id])
    @participations = Participation.where(contest_id: @contest.id).order(betcoins: :desc)
  end
end
