class Property < ApplicationRecord
  validates :property_type, :address, :bedrooms, :bathrooms, :area, :image, presence: true
end
