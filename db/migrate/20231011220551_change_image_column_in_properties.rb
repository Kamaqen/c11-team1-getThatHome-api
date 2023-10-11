class ChangeImageColumnInProperties < ActiveRecord::Migration[7.1]
  def up
    # Add a new column to store the data temporarily as JSON
    add_column :properties, :new_image, :json, array: true, default: []

    # Update the new column using the existing data, converting it to JSON
    Property.all.each do |property|
      property.update(new_image: [property.image])
    end

    # Remove the old "image" column
    remove_column :properties, :image

    # Rename the new column to match the old name
    rename_column :properties, :new_image, :image
  end

  def down
    # In the down migration, you can revert the changes made in the up migration
    remove_column :properties, :image

    add_column :properties, :new_image, :string, array: true

    Property.all.each do |property|
      property.update(new_image: [property.image])
    end

    rename_column :properties, :new_image, :image
  end
end
