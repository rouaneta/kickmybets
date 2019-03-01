class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
    @user = current_user
    @participation = Participation.new
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

  def invite
    user = User.find_by(email: params[:email])
    contest = Contest.find(params[:id])
    InvitationMailer.invitation(user, contest).deliver_now!
    head :ok
  end

  def update_games
    @contest = Contest.find(params[:id])
    (2..@contest.phases).to_a.reverse_each do |phase|
      update_next_games(@contest, phase)
    end
    redirect_to contest_path(@contest)
  end

  private

  def generate_games(contest)
    phase = Math.log2(contest.players_nb).to_i
    match_nb_total = contest.players_nb - 1
    match_nb_phase = contest.players_nb / 2

    # generates pending games for next phases
    (1..phase - 1).to_a.each do |phase_nb|
      games_nb = 2**(phase_nb - 1)
      num = games_nb
      (1..games_nb).to_a.each do |index|
        Game.create!(
          game_code: num.to_s(2),
          name: "P1/#{games_nb}_#{index}",
          phase: phase_nb,
          contest: contest
          )
        num += 1
      end
    end

    # generates random games for current phase
    contest.players.shuffle.each_slice(2).to_a.each_with_index do |game_players, index|
      num = match_nb_total - match_nb_phase + 1 + index
      Game.create!(
        player_one: game_players[0],
        player_two: game_players[1],
        phase: phase,
        game_code: num.to_s(2),
        name: "P1/#{2**(phase - 1)}_#{index + 1}",
        status: 'coming',
        contest: contest
      )
    end
  end

  def update_next_games(contest, phase)
    games = contest.games.where(phase: phase).group_by { |e| e.game_code[0..phase - 2] }
    games.to_a.each do |game|
      next_game = contest.games.where(phase: phase - 1).where(game_code: game[0]).first
      if (closed?(game[1])) && next_game.status == "pending"
        next_game.player_one_id = game[1][0].player_winner_id
        next_game.player_two_id = game[1][1].player_winner_id
        next_game.status = "coming"
        next_game.save!
      end
    end
  end

  def closed?(games)
    result = true
    games.each do |game|
      result = false unless game.status == "closed"
    end
    return result
  end

  def code_invit
    code = ""
    8.times { code += [rand(48..57).chr, rand(97..122).chr, rand(65..90).chr].sample.to_s }
    return code
  end

  def contest_params
    params.require(:contest).permit(:category, :title, :description, :creator_id,
                                    :players_nb, :coins_init, players_attributes: [:name])
  end
end
