class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, dependent: :destroy

  validates :contest_id, uniqueness: true
end
