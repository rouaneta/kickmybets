class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @participation = Participation.find(params[:participation_id])
    @event.contest = @participation.contest
    @event.user = current_user
    if @event.save
      render :create_success
    else
      render :create_error
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to participation_path(Participation.find(params[:participation_id]))
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :choice_one, :choice_two, :choice_win, :start_time, :end_time)
  end
end

