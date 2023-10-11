class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users
  
  validates :property_type, :address, :bedrooms, :bathrooms, :area, :image, presence: true
end
