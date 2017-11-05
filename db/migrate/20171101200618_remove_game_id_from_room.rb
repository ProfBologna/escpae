class RemoveGameIdFromRoom < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :game_id, :integer
  end
end
