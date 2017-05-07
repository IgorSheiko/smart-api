class CreateSystem < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :system_name
    end
  end
end
