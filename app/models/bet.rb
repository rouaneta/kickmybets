class Bet < ApplicationRecord
  belongs_to :participation
  belongs_to :resource, polymorphic: true
end
