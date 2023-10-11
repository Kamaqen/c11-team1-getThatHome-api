class Property < ApplicationRecord
  belongs_to :user
  
  validates :property_type, :address, :bedrooms, :bathrooms, :area, :image, presence: true
end
