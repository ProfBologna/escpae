class Room < ApplicationRecord
  has_many :game_rooms
  has_many :items
  has_many :games, through: :game_rooms
  belongs_to :user


  def found?(item_name)
    items.find_by(name: item_name).status
  end

  def not_found?(item_name)
    !found?(item_name)
  end

  def update_found(item_name)
    items.find_by(name: item_name).update_attributes(status: true)
  end
  
  def percentage_complete
    items_count = items.count
    items_complete_count = items.where(status: true).count
    (items_complete_count/items_count.to_f * 100).round(0)
  end
  
end
