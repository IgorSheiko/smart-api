class CreateRoomCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :room_categories do |t|
      t.string :room_name
    end
  end
end
