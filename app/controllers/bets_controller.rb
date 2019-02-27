class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    @bet.participation = Participation.find(params[:participation_id])
    @bet.save
    redirect_to participation_path(@bet.participation)
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :choice, :resource_type, :resource_id)
  end
end
