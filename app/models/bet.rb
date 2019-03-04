class Bet < ApplicationRecord
  belongs_to :participation
  belongs_to :resource, polymorphic: true
  has_one :contest, through: :participation

  validates :participation_id, uniqueness: { scope: %i[resource_type resource_id] }
  validate :enough_coins, on: :create
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

  after_save :update_resource_odds, :update_participation_betcoins

  private

  def enough_coins
    return unless participation
    return if amount.blank?

    errors.add(:amount, "too high for your missing betcoins") if amount > participation.betcoins
  end

  def update_resource_odds
    sum_bets_one = resource.bets.where(choice: 1).sum(:amount)
    sum_bets_two = resource.bets.where(choice: 2).sum(:amount)
    sum_bets = sum_bets_one + sum_bets_two
    return if sum_bets_one.zero? && sum_bets_two.zero?

    odds_choice_one = (1 + (sum_bets_two + 0.1 * sum_bets) / (sum_bets_one + 0.1 * sum_bets)).round(2)
    odds_choice_two = (1 + (sum_bets_one + 0.1 * sum_bets) / (sum_bets_two + 0.1 * sum_bets)).round(2)
    resource.update!(odds_choice_one: odds_choice_one, odds_choice_two: odds_choice_two)
  end

  def update_participation_betcoins
    participation.betcoins = participation.contest.coins_init - participation.bets.sum(:amount) + participation.bets.sum(:gains)
    participation.save!
  end
end
