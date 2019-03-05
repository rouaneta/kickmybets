class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :contest_id, uniqueness: { scope: :user_id }
  validates :betcoins, presence: true
end
