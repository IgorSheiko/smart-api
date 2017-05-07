class CreateRoomsSystem < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms_systems do |t|
      t.integer :room_id
      t.integer :system_id
    end
  end
end
