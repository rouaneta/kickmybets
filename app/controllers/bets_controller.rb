class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    @bet.participation = Participation.find(params[:participation_id])
    @bet.save!
    redirect_to root_path
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :choice, :resource_type, :resource_id)
  end
end
