class CreateUsersProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :users_properties, id: false do |t|
      t.belongs_to :user
      t.belongs_to :property
      t.boolean :is_contacted
      t.boolean :is_saved
    end

    add_index :users_properties, [:user_id, :property_id], unique: true
  end
end
