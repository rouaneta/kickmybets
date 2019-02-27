class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @bet = Bet.new
    @event = Event.new
    @events = Event.where(contest: @participation.contest).all
  end

  def create
  end
end
