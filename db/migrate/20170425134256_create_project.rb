class CreateProject < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :project_name
    end
  end
end
