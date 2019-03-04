class Contest < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :players, dependent: :destroy
  accepts_nested_attributes_for :players
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :games, dependent: :destroy
  has_many :bets_on_events, through: :events, source: :bets, as: :resource
  has_many :bets_on_games, through: :games, source: :bets, as: :resource
  has_many :bets, through: :participations

  validates :category, inclusion: { in: %w[cup league] }, presence: true
  validates :status, inclusion: { in: %w[opened closed finished] }
  validates :title, presence: true
  validates :coins_init, presence: true, numericality: { greater_than: 0 }
  validates :code, uniqueness: true
  validates :players_nb, presence: true

  after_create :generate_grid

  def phases
    Math.log2(players_nb).to_i
  end

  def current_phase
    self.games.where(status: "coming").select(:phase).distinct.map {|e| e.phase}.max
  end
  
  private

  def generate_grid
    GameGridGenerator.new(self).process
  end
end
