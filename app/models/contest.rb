class Contest < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players
  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :games_as_p_one, through: :players
  has_many :games_as_p_two, through: :players
  has_many :bets_on_events, through: :events, source: :bets, as: :resource
  has_many :bets_on_games_as_p_one, through: :games_as_p_one, source: :bets
  has_many :bets_on_games_as_p_two, through: :games_as_p_one, source: :bets
  has_many :bets, through: :participations

  validates :category, inclusion: { in: %w(cup league) }, presence: true
  validates :status, inclusion: { in: %w(opened closed finished) }
  validates :title, presence: true
  validates :coins_init, presence: true, numericality: { greater_than: 0 }
  validates :code, uniqueness: true
  validates :players_nb, presence: true

  def games
    (games_as_p_one.all + games_as_p_two.all).uniq
  end

  def bets_on_games
    (bets_on_games_as_p_one.all + bets_on_games_as_p_two.all).uniq
  end
end
