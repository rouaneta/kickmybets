class GamesController < ApplicationController
  def update
    @game = Game.find(params[:id])
    @game.score_p_one = params[:game][:score_p_one].to_i
    @game.score_p_two = params[:game][:score_p_two].to_i
    if @game.score_p_one == '' || @game.score_p_two == '' || @game.score_p_one == @game.score_p_two
      flash[:notice] = 'Scores must be differents and correcly filled'
    else
      @game.choice_win = @game.score_p_one > @game.score_p_two ? 1 : 2
      @game.save
    end
    render :update_status_success
  end

  def update_status
    @game = Game.find(params[:id])
    @game.update(status: 'ongoing')
    render :update_status_success
  end
end
