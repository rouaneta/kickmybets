class GamesController < ApplicationController
  def update
    @game = Games.find(params[:id])
    @game.update(params[:game])
  end
end
