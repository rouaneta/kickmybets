class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.valid?
      @contest = Contest.create!(contest_params)
      @contest.update(code: code_invit)
      generate_games(@contest)
      redirect_to contest_path(@contest)
    else
      render :new
    end
  end

  private

  def generate_games(contest)
    contest.players.shuffle.each_slice(2).to_a.each do |game_players|
      Game.create!(
        player_one: game_players[0],
        player_two: game_players[1],
        phase: Math.log2(contest.players_nb)
      )
    end
  end

  def contest_params
    params.require(:contest).permit(:category, :title, :description, :creator_id,
                                    :players_nb, :coins_init, players_attributes: [:name])
  end

  def code_invit
    code = ""
    8.times { code += [rand(48..57).chr, rand(97..122).chr, rand(65..90).chr].sample.to_s }
    return code
  end
end
