class EventsController < ApplicationController
  def create
    @event = Event.new(event_params)
    @participation = Participation.find(params[:participation_id])
    @event.participation = @participation
    if @event.save
      render :create_success
    else
      render :create_error
    end
  end

  def update_status
    @event = Event.find(params[:id])
    @event.update(status: 'ongoing')
    redirect_to participation_path(Participation.find(params[:participation_id]))
  end

  def update
    @event = Event.find(params[:id])
    if [1, 2, '1', '2'].include?(params[:event][:choice_win]) && @event.update(choice_win: params[:event][:choice_win])
      render :update_success
    else
      render :update_error
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :choice_one, :choice_two, :choice_win, :start_time, :end_time)
  end
end
