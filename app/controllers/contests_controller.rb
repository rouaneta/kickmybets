class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
  end

  def new
    @contest = Contest.new
    @code = code_invit
  end

  def create
    @contest = Contest.create!(contest_params)
    if @contest
      generate_games(@contest)
      redirect_to contest_path(@contest)
    else
      render :new
    end
  end

  private

  def generate_games(contest)
    # TODO, generate games, we already have @contest.players
  end

  def contest_params
    params.require(:contest).permit(:category, :title, :description, :code, :creator_id, :players_nb, :coins_init, players_attributes: [:name])
  end

  def code_invit
    code = ""
    8.times { code += [rand(48..57).chr, rand(97..122).chr, rand(65..90).chr].sample.to_s }
    return code
  end
end
