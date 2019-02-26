class Game < ApplicationRecord
  belongs_to :player_one, class_name: "Player", foreign_key: "player_one_id"
  belongs_to :player_two, class_name: "Player", foreign_key: "player_two_id"
  has_many :bets, as: :resource, dependent: :destroy
  validates :status, inclusion: { in: %w(coming ongoing finished) }
  validate :check_player_ids, on: :create

  private
  
  def check_player_ids
    errors.add(:player_two_id, "players must be different") if player_one_id == player_two_id
  end
end
