class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.date :birth_date
      t.string :phone_number
      t.references :user
    end
  end
end
