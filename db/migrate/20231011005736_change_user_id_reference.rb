class ChangeUserIdReference < ActiveRecord::Migration[7.1]
  def change
    remove_column :properties, :user_id, :string
    add_reference :properties, :user, foreign_key: true 
  end
end
