class CreateRoom < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :project_id
      t.integer :room_category_id
    end
  end
end
