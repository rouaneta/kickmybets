class Player < ApplicationRecord
  belongs_to :contest
  has_many :games_as_p_one, class_name: "Game", foreign_key: "player_one_id"
  has_many :games_as_p_two, class_name: "Game", foreign_key: "player_two_id"
end
