class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :game_id
      t.string :description
      t.timestamps
    end
  end
end
