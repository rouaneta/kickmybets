class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, as: :resource, dependent: :destroy

  validates :title, :choice_one, :choice_two, presence: true
  validates :status, inclusion: { in: %w(coming ongoing finished) }
  validate :check_choices, on: :create

  private

  def check_choices
    errors.add(:choice_two, "choices must be different") if choice_one == choice_two
  end
end