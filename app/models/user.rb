class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contests, foreign_key: :creator_id, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  has_many :bets, through: :participations

  validates :nickname, uniqueness: true, presence: true

end
