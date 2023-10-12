class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users,
                          join_table: 'users_properties',
                          class_name: 'User',
                          foreign_key: 'property_id',
                          association_foreign_key: 'user_id'
  
  validates  :property_type, :operation_type,:address, :bedrooms, :bathrooms, :urls, :area, presence: true
  enum operation_type: { sale: 0, rent: 1 }
  enum property_type: { house: 0, department: 1 }
end
