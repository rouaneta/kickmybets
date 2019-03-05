class Comment < ApplicationRecord
  belongs_to :participation
  belongs_to :resource, polymorphic: true
  has_one :user, through: :participation

  validates :content, presence: true
end
