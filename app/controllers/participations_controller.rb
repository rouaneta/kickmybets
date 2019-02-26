class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @event = Event.new
    @events = Event.all
  end

  def create

  end
end
