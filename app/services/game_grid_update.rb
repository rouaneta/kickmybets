class GameGridUpdate
  def initialize(contest)
    @contest = contest
  end

  def process
    (2..@contest.phases).to_a.reverse_each do |phase|
      update_next_games(@contest, phase)
    end
  end

  private

  def update_next_games(contest, phase)
    games = contest.games.where(phase: phase).group_by { |e| e.game_code[0..phase - 2] }
    games.to_a.each do |game|
      next_game = contest.games.where(phase: phase - 1).where(game_code: game[0]).first
      next unless closed?(game[1]) && next_game.status == "pending"

      next_game.player_one_id = game[1][0].player_winner_id
      next_game.player_two_id = game[1][1].player_winner_id
      next_game.status = "coming"
      next_game.save!
    end
  end

  def closed?(games)
    result = true
    games.each do |game|
      result = false unless game.status == "closed"
    end
    return result
  end
end
