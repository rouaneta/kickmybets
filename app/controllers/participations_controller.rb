class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @bet = Bet.new
    @event = Event.new
    @events = Event.where(contest: @participation.contest).all
    @bets = Bet.where(participation: @participation).all
  end

  def create
    if params[:code]
      create_by_code
    else
      @participation = Participation.new(participation_params)
      if @participation.save
        redirect_to participation_path(@participation)
      else
        redirect_to contest_path(@participation.contest)
      end
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :contest_id)
  end
      
  def create_by_code
    @contest = Contest.find_by(code: params[:code])
    if @contest
      Participation.create!(contest: @contest, user: current_user)
      render :create_success
    else
      render :create_error
    end
  end

end
