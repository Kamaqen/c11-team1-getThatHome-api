class CreateUserProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :user_properties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.boolean :saved, default: false
      t.boolean :contacted, default: false

      t.timestamps
    end
  end
end
