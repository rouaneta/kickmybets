class Bet < ApplicationRecord
  belongs_to :resource
  belongs_to :participation
  belongs_to :resource, polymorphic: true
end
