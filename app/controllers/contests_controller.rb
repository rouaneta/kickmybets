class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create!(contest_params)
    if @contest
      @contest.update(code: code_invit)
      generate_games(@contest)
      redirect_to contest_path(@contest)
    else
      render :new
    end
  end

  private

  def generate_games(contest)
    phase = Math.log2(contest.players_nb).to_i
    match_nb_total = contest.players_nb - 1
    match_nb_phase = contest.players_nb / 2
    contest.players.shuffle.each_slice(2).to_a.each_with_index do |game_players, index|
      num = match_nb_total - match_nb_phase + 1 + index
      Game.create!(
        player_one: game_players[0],
        player_two: game_players[1],
        phase: phase,
        game_code: num.to_s(2),
        name: "P1/#{2 ** (phase - 1)}_#{index + 1}"
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
