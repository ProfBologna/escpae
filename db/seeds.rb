Game.create!([
  {},
  {}
])
GameRoom.create!([
  {room_id: 1, game_id: 1},
  {room_id: 1, game_id: 1}
])
Item.create!([
  {room_id: 1, name: "Door", status: false, user_id: nil},
  {room_id: 1, name: "Bottle of Water", status: true, user_id: nil},
  {room_id: 1, name: "Potted Plant", status: true, user_id: nil},
  {room_id: 1, name: "key", status: false, user_id: nil},
  {room_id: 1, name: "Couch", status: false, user_id: nil},
  {room_id: 1, name: "Coffee Table", status: false, user_id: nil},
  {room_id: 1, name: "Shelf", status: false, user_id: nil},
  {room_id: 1, name: "Fishing Pole", status: false, user_id: nil},
  {room_id: 1, name: "Cushions", status: false, user_id: nil},
  {room_id: 1, name: "Box", status: true, user_id: nil},
  {room_id: 1, name: "Fisherman", status: true, user_id: nil},
  {room_id: 1, name: "Desk", status: true, user_id: nil},
  {room_id: 1, name: "Cell Phone", status: true, user_id: nil},
  {room_id: 2, name: "Bottle of Water", status: true, user_id: 2},
  {room_id: 2, name: "Potted Plant", status: true, user_id: 2},
  {room_id: 2, name: "Couch", status: false, user_id: 2},
  {room_id: 2, name: "Coffee Table", status: false, user_id: 2},
  {room_id: 2, name: "Shelf", status: false, user_id: 2},
  {room_id: 1, name: "Key", status: false, user_id: nil},
  {room_id: 2, name: "Fishing Pole", status: false, user_id: 2},
  {room_id: 2, name: "Cushions", status: false, user_id: 2},
  {room_id: 2, name: "Box", status: true, user_id: 2},
  {room_id: 2, name: "Fisherman", status: true, user_id: 2},
  {room_id: 2, name: "Desk", status: true, user_id: 2},
  {room_id: 2, name: "Cell Phone", status: true, user_id: 2},
  {room_id: 1, name: "Door", status: false, user_id: nil},
  {room_id: 1, name: "Bottle of Water", status: true, user_id: nil},
  {room_id: 1, name: "Potted Plant", status: true, user_id: nil},
  {room_id: 1, name: "key", status: false, user_id: nil},
  {room_id: 1, name: "Couch", status: false, user_id: nil},
  {room_id: 1, name: "Coffee Table", status: false, user_id: nil},
  {room_id: 1, name: "Shelf", status: false, user_id: nil},
  {room_id: 1, name: "Fishing Pole", status: false, user_id: nil},
  {room_id: 1, name: "Cushions", status: false, user_id: nil},
  {room_id: 1, name: "Box", status: true, user_id: nil},
  {room_id: 1, name: "Fisherman", status: true, user_id: nil},
  {room_id: 1, name: "Desk", status: true, user_id: nil},
  {room_id: 1, name: "Cell Phone", status: true, user_id: nil},
  {room_id: 2, name: "Bottle of Water", status: true, user_id: 2},
  {room_id: 2, name: "Potted Plant", status: true, user_id: 2},
  {room_id: 2, name: "Couch", status: false, user_id: 2},
  {room_id: 2, name: "Coffee Table", status: false, user_id: 2},
  {room_id: 2, name: "Shelf", status: false, user_id: 2},
  {room_id: 1, name: "Key", status: false, user_id: nil},
  {room_id: 2, name: "Fishing Pole", status: false, user_id: 2},
  {room_id: 2, name: "Cushions", status: false, user_id: 2},
  {room_id: 2, name: "Box", status: true, user_id: 2},
  {room_id: 2, name: "Fisherman", status: true, user_id: 2},
  {room_id: 2, name: "Desk", status: true, user_id: 2},
  {room_id: 2, name: "Cell Phone", status: true, user_id: 2},
  {room_id: 1, name: "Desk", status: false, user_id: nil},
  {room_id: 1, name: "Desk", status: false, user_id: nil}
])
Room.create!([
  {description: "You wake up on a floor in a room. You don’t remember falling asleep or how you got here in the first place. You stand up and check your pockets: nothing. Whatever happened wasn’t an accident. You take a look around.  The room appears to be in neat and orderly condition - someone is obviously taking care of things around here. You see: a DESK, a COUCH, a DOOR, a COFFEE TABLE, A POTTED PLANT, and a SHELF.", user_id: nil},
  {description: "You wake up on a floor in a room. You don’t remember falling asleep or how you got here in the first place. You stand up and check your pockets: nothing. Whatever happened wasn’t an accident. You take a look around.  The room appears to be in neat and orderly condition - someone is obviously taking care of things around here. You see: a DESK, a COUCH, a DOOR, a COFFEE TABLE, A POTTED PLANT, and a SHELF.", user_id: 2}
])
User.create!([
  {name: "Joe Cool", email: "joe@cool.com", password_digest: "$2a$10$2ZsFqtiwGj79g02FvMLoguVFroHu/iNVOoPGsLTRmCynlsr.Hqw02"},
  {name: "Diana", email: "diana@diana.com", password_digest: "$2a$10$2nAFK8ZMMguoTG6wxfV1xuPL/kP0peoWnB0/2hdwvlSogp6Eewcuu"}
])
