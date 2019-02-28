class Event < ApplicationRecord
  belongs_to :user
  belongs_to :contest
  has_many :bets, as: :resource, dependent: :destroy

  validates :title, :choice_one, :choice_two, presence: true
  validates :status, inclusion: { in: %w[coming ongoing finished] }
  validate :check_choices, on: :create

  def betable?(user)
    bets.each do |bet|
      return false if bet.participation.user_id == user.id
    end
    true
  end

  def choice1
    choice_one
  end

  def choice2
    choice_two
  end

  private

  def check_choices
    errors.add(:choice_two, "choices must be different") if choice_one == choice_two
  end
end
