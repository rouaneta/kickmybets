class Game < ApplicationRecord
  belongs_to :contest
  belongs_to :player_one, class_name: "Player", foreign_key: "player_one_id", optional: true
  belongs_to :player_two, class_name: "Player", foreign_key: "player_two_id", optional: true
  has_many :bets, as: :resource, dependent: :destroy

  validates :status, inclusion: { in: %w[pending coming ongoing finished closed] }

  before_save :update_status, :update_winner

  def betable?(user)
    bets.each do |bet|
      return false if bet.participation.user_id == user.id
    end
    true
  end

  def choice_one
    player_one.name
  end

  alias_method :choice1, :choice_one

  def choice_two
    player_two.name
  end

  alias_method :choice2, :choice_two

  private

  def update_status
    self.status = "closed" if score_p_one.present? && score_p_two.present?
  end

  def update_winner
    return if status != "closed"

    if score_p_one > score_p_two
      self.choice_win = 1
      self.player_winner_id = player_one_id
    elsif score_p_one < score_p_two
      self.choice_win = 2
      self.player_winner_id = player_two_id
    end
  end
end
