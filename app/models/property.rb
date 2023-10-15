class Property < ApplicationRecord
  belongs_to :user
  has_many :user_properties
  has_many :users, through: :user_properties
  
  validates  :property_type, :operation_type,:address, :bedrooms, :bathrooms, :area, :urls, presence: true
  enum operation_type: { sale: 0, rent: 1 }
  enum property_type: { house: 0, apartment: 1 }
end
