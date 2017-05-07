class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password_digest, null: false, default: ''
      t.string :email
      t.string :authentication_token
    end
    add_index :users, :email, unique: true
  end
end
