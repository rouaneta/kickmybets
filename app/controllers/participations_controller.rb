class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @bet = Bet.new
    @event = Event.new
    @events = Event.where(contest: @participation.contest).all
    @bets = Bet.where(participation: @participation).all
  end

  def create
    @contest = Contest.find_by(code: params[:code])
    if @contest
      Participation.create!(contest: @contest, user: current_user)
      render :create_success
    else
      render :create_error
    end
    # redirect_to root_path
  end
end
