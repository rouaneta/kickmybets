class Player < ApplicationRecord
  belongs_to :contest

  has_many :games_as_p_one, class_name: "Game", foreign_key: "player_one_id", dependent: :destroy
  has_many :games_as_p_two, class_name: "Game", foreign_key: "player_two_id", dependent: :destroy
  has_many :bets_as_p_one, through: :games_as_p_one, source: :bets
  has_many :bets_as_p_two, through: :games_as_p_two, source: :bets

  validates :name, presence: true

  def games
    (games_as_p_one.all + games_as_p_two.all).uniq
  end

  def bets
    (bets_as_p_one.all + bets_as_p_two.all).uniq
  end
end
