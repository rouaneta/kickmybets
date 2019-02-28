class Bet < ApplicationRecord
  belongs_to :participation
  belongs_to :resource, polymorphic: true

  validates :participation_id, uniqueness: { scope: %i[resource_type resource_id] }
  validates :amount, presence: true
end
