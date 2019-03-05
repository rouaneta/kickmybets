class Event < ApplicationRecord
  belongs_to :participation
  has_many :bets, as: :resource, dependent: :destroy
  has_many :comments, as: :resource, dependent: :destroy
  has_one :contest, through: :participation
  has_one :user, through: :participation

  validates :title, :choice_one, :choice_two, presence: true
  validates :status, inclusion: { in: %w[coming ongoing finished] }
  validate :check_choices, on: :create

  before_save :update_status
  after_save :update_bets_gains

  def betable?(user)
    return false unless status == 'coming'

    bets.none? { |bet| bet.participation.user_id == user.id }
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

  def update_status
    self.status = "closed" if choice_win.present?
  end

  def update_bets_gains
    UpdateBetsGains.new(self).process
  end
end
