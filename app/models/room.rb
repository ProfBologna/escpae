class Room < ApplicationRecord
  has_many :game_rooms
  has_many :items
  has_many :games, through: :game_rooms


  def found?(item_name)
    items.find_by(name: item_name).status
  end

  def not_found?(item_name)
    !found?(item_name)
  end

  def update_found(item_name)
    items.find_by(name: item_name).update_attributes(status: true)
  end
  
end
