# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :token
      t.string :name
      t.string :phone_number
      t.integer :role
      t.timestamps
    end
    add_index :users, :token, unique: true
  end
end
