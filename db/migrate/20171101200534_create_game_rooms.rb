class CreateGameRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :game_rooms do |t|
      t.integer :room_id
      t.integer :game_id

      t.timestamps
    end
  end
end
