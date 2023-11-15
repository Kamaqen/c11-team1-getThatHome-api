# frozen_string_literal: true

class RemoveUsersProperties < ActiveRecord::Migration[7.1]
  def up
    drop_table :users_properties
  end

  def down
    create_table :users_properties do |t|
      t.belongs_to :user
      t.belongs_to :property
      t.boolean :is_contacted
      t.boolean :is_saved
    end

    add_index :users_properties, %i[user_id property_id], unique: true
  end
end
