class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, as: :resource
end
