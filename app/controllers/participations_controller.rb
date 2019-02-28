class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @bet = Bet.new
    @event = Event.new
    @events = Event.where(contest: @participation.contest).all
    @bets = Bet.where(participation: @participation).all
  end

  def create
    @participation = Participation.new(participation_params)
    if @participation.save
      redirect_to participation_path(@participation)
    else
      redirect_to contest_path(@participation.contest)
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :contest_id)
  end
end
