class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :room_id
      t.string :name
      t.string :description
      t.boolean :status

      t.timestamps
    end
  end
end
