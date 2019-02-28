class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    @bet.participation = Participation.find(params[:participation_id])
    if @bet.save
      render :create_success
    else
      puts 'asfdsg'
      render :create_error
    end
    # redirect_to participation_path(@bet.participation)
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :choice, :resource_type, :resource_id)
  end
end
