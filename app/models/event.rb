class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, as: :resource, dependent: :destroy

  validates :title, :choice_one, :choice_two, presence: true
  validates :status, inclusion: { in: %w(coming ongoing finished) }
end
