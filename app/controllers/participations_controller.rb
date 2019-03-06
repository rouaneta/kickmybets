class ParticipationsController < ApplicationController
  def show
    @participation = Participation.find(params[:id])
    @event = Event.new
    @events = Event.joins(:participation).where("participations.contest_id = ?", @participation.contest_id)
    @bets = Bet.where(participation: @participation).all
  end

  def create
    if params[:code]
      create_by_code(params[:code])
    else
      @participation = Participation.new(participation_params)
      @participation.betcoins = @participation.contest.coins_init
      if @participation.save
        redirect_to participation_path(@participation)
      else redirect_to contest_path(@participation.contest)
      end
    end
  end

  private

  def participation_params
    params.require(:participation).permit(:user_id, :contest_id)
  end

  def create_by_code(code)
    @contest = Contest.find_by(code: code)
    if @contest
      @participation_new = Participation.create!(contest: @contest, user: current_user, betcoins: @contest.coins_init)
      render :create_success
    else
      render :create_error
    end
  end
end
