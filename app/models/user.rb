class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :games
  has_many :rooms

  def self.create_game(current_user_id)
    room = Room.new(
                    description: "You wake up on a floor in a room. You don’t remember falling asleep or how you got here in the first place. You stand up and check your pockets: nothing. Whatever happened wasn’t an accident. You take a look around.  The room appears to be in neat and orderly condition - someone is obviously taking care of things around here. You see: a DESK, a COUCH, a DOOR, a COFFEE TABLE, A POTTED PLANT, and a SHELF.",
                    user_id: current_user_id
                  )

    room.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Cell Phone",
                    status: false
                    )

    item.save


    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Key",
                    status: false
                    )

    item.save


    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Fishing Pole",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Coffee Table",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Bottle of Water",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Fisherman",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Box",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Potted Plant",
                    status: false
                    )

    item.save

    item = Item.new(
                    room_id: room.id,
                    user_id: current_user_id,
                    name: "Desk",
                    status: false
                    )

    item.save
  end
      
end
