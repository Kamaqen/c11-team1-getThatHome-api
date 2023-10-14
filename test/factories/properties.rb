FactoryBot.define do
  factory :property do
    rent_value { Faker::Number.number(digits: 4) }
    bedrooms { Faker::Number.number(digits: 1) }
    bathrooms { Faker::Number.number(digits: 1) }
    property_type { 'house' }
    operation_type { 'sale' }
    urls { ["www.login.com","value2"] }
    description { Faker::Lorem.paragraph }
    address { Faker::Address.full_address }
    pet_friendly { Faker::Boolean.boolean }
    area { Faker::Number.number(digits: 4) }
    property_price { Faker::Number.number(digits: 6) }
    maintenance_price { Faker::Number.number(digits: 4) }
    association :user, factory: :user
    is_active { true }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end