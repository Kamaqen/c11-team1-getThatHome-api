class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.integer :rent_value
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :property_type
      t.integer :operation_type
      t.string :url
      t.text :description
      t.string :address
      t.boolean :pet_friendly
      t.string :area
      t.integer :property_price
      t.integer :maintenance_price
      t.integer :user_id
      t.boolean :is_active
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end
end
