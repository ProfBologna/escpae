class Room < ApplicationRecord
  has_many :game_rooms
  has_many :items
  has_many :games, through: :game_rooms

end
