class GameGridGenerator
  def initialize(contest)
    @contest = contest
  end

  def process
    generate_games_for_first_phase(@contest)
    generate_games_for_next_phases(@contest)
  end

  private

  def generate_games_for_first_phase(contest)
    # generates random games for first phase
    match_nb_total = contest.players_nb - 1
    match_nb_phase = contest.players_nb / 2
    contest.players.shuffle.each_slice(2).to_a.each_with_index do |game_players, index|
      num = match_nb_total - match_nb_phase + 1 + index
      Game.create!(player_one: game_players[0], player_two: game_players[1], phase: contest.phases,
                   game_code: num.to_s(2), name: "P1/#{2**(contest.phases - 1)}_#{index + 1}",
                   status: 'coming', contest: contest)
    end
  end

  def generate_games_for_next_phases(contest)
    # generates pending games for next phases
    (1..contest.phases - 1).to_a.reverse_each do |phase_nb|
      games_nb = 2**(phase_nb - 1)
      num = games_nb
      (1..games_nb).to_a.each do |index|
        Game.create!(game_code: num.to_s(2), name: "P1/#{games_nb}_#{index}", phase: phase_nb, contest: contest)
        num += 1
      end
    end
  end
end
