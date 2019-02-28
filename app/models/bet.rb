class Bet < ApplicationRecord
  belongs_to :participation
  belongs_to :resource, polymorphic: true

  validates :participation_id, uniqueness: { scope: %i[resource_type resource_id] }
  validates :amount, presence: true, numericality: { greather_than: 0 }
  validate :enough_coins, on: :create

  private

  def enough_coins
    return unless participation
    return if amount.blank?

    errors.add(:amount, "too high for your missing betcoins") if amount > participation.betcoins
  end
end
