class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @bet = Bet.new
  end

  def create

  end
end
