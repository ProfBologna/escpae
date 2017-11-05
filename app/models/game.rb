class Game < ApplicationRecord
  has_many :game_rooms
  has_many :rooms, through: :game_rooms
end
