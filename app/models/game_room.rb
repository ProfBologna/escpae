class GameRoom < ApplicationRecord
  belongs_to :room
  belongs_to :game
end
