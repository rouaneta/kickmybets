class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    @participation = Participation.find(params[:participation_id])
    @bet.participation = @participation
    if @bet.save
      render :create_success
    else
      @bet.amount = ''
      render :create_error
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :comment, :choice, :resource_type, :resource_id)
  end
end
