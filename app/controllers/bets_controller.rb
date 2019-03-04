class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    puts "8"*99
    puts bet_params
    @participation = Participation.find(params[:participation_id])
    @bet.participation = @participation
    ap @bet
    if @bet.save
      render :create_success
    else
      @bet.amount = ''
      render :create_error
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :comment, :choice, :resource, :resource_type, :resource_id)
  end
end
1
