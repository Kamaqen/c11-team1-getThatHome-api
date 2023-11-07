# frozen_string_literal: true

require 'faker'

# Eliminate all existing user_properties, properties, and users before creating new records
UserProperty.destroy_all
Property.destroy_all
User.destroy_all

# Method for create properties
def create_property(user, property_urls)
  property_params = {
    bedrooms: Faker::Number.between(from: 1, to: 5),
    bathrooms: Faker::Number.between(from: 1, to: 3),
    property_type: Faker::Number.between(from: 0, to: 1),
    operation_type: Faker::Number.between(from: 0, to: 1),
    urls: [property_urls.sample],
    description: Faker::Lorem.sentence,
    address: Faker::Address.full_address,
    pet_friendly: Faker::Boolean.boolean,
    area: Faker::Number.between(from: 50, to: 200),
    user: user
  }

  if property_params[:operation_type] == 1  
    property_params[:rent_value] = Faker::Number.between(from: 500, to: 5000)
    property_params[:maintenance_price] = Faker::Number.between(from: 100, to: 1000)
    property_params[:property_price] = "0"
  elsif  property_params[:operation_type] == 0
    property_params[:rent_value] = "0"
    property_params[:maintenance_price] = "0"
    property_params[:property_price] = Faker::Number.between(from: 10000, to: 100000)
  end

  Property.create!(property_params)
end

def create_user(role)
  User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    password_confirmation: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    role:
  )
end

# Properties Urls
property_urls = [
  'https://source.unsplash.com/800x600/?beach-house',
  'https://source.unsplash.com/800x600/?countryside-home',
  'https://source.unsplash.com/800x600/?city-apartment',
  'https://source.unsplash.com/800x600/?garden-house',
  'https://source.unsplash.com/800x600/?office-space',
  'https://source.unsplash.com/800x600/?cabin',
  'https://source.unsplash.com/800x600/?penthouse',
  'https://source.unsplash.com/800x600/?vintage-interior',
  'https://source.unsplash.com/800x600/?rustic-home',
  'https://source.unsplash.com/800x600/?townhouse',
  'https://source.unsplash.com/800x600/?farmhouse',
  'https://source.unsplash.com/800x600/?interior-design',
  'https://source.unsplash.com/800x600/?loft',
  'https://source.unsplash.com/800x600/?skyscraper',
  'https://source.unsplash.com/800x600/?suburban-home',
  'https://source.unsplash.com/800x600/?villa',
  'https://source.unsplash.com/800x600/?chateau',
  'https://source.unsplash.com/800x600/?lighthouse',
  'https://source.unsplash.com/800x600/?apartment-building',
  'https://source.unsplash.com/800x600/?country-home',
  'https://source.unsplash.com/800x600/?modern-home',
  'https://source.unsplash.com/800x600/?family-house',
  'https://source.unsplash.com/800x600/?living-room-design',
  'https://source.unsplash.com/800x600/?urban-house',
  'https://source.unsplash.com/800x600/?backyard',
  'https://source.unsplash.com/800x600/?cottage',
  'https://source.unsplash.com/800x600/?pool-house',
  'https://source.unsplash.com/800x600/?vintage-home',
  'https://source.unsplash.com/800x600/?minimalist-interior',
  'https://source.unsplash.com/800x600/?mountain-house',
  'https://source.unsplash.com/800x600/?apartment',
  'https://source.unsplash.com/800x600/?cozy-home',
  'https://source.unsplash.com/800x600/?luxury-house',
  'https://source.unsplash.com/800x600/?kitchen',
  'https://source.unsplash.com/800x600/?bedroom',
  'https://source.unsplash.com/800x600/?architecture',
  'https://source.unsplash.com/800x600/?home',
  'https://source.unsplash.com/800x600/?modern-house',
  'https://source.unsplash.com/800x600/?living-room',
  'https://source.unsplash.com/800x600/?real-estate',
  'https://source.unsplash.com/800x600/?beach-house',
  'https://source.unsplash.com/800x600/?countryside-home',
  'https://source.unsplash.com/800x600/?city-apartment',
  'https://source.unsplash.com/800x600/?garden-house',
  'https://source.unsplash.com/800x600/?office-space',
  'https://source.unsplash.com/800x600/?cabin',
  'https://source.unsplash.com/800x600/?penthouse',
  'https://source.unsplash.com/800x600/?vintage-interior',
  'https://source.unsplash.com/800x600/?rustic-home',
  'https://source.unsplash.com/800x600/?townhouse',
  'https://source.unsplash.com/800x600/?farmhouse',
  'https://source.unsplash.com/800x600/?interior-design',
  'https://source.unsplash.com/800x600/?loft',
  'https://source.unsplash.com/800x600/?skyscraper',
  'https://source.unsplash.com/800x600/?suburban-home',
  'https://source.unsplash.com/800x600/?villa',
  'https://source.unsplash.com/800x600/?chateau',
  'https://source.unsplash.com/800x600/?lighthouse',
  'https://source.unsplash.com/800x600/?apartment-building',
  'https://source.unsplash.com/800x600/?country-home'
]

# Create fixed users
user0 = User.create(email: 'test@mail.com', password: '123456', password_confirmation: '123456', name: 'testino',
                    phone_number: '555555', role: 0)
user2 = User.create(email: 'hello@mail.com', password: '123456', password_confirmation: '123456', name: 'hello',
                    phone_number: '12334456', role: 1)
user3 = User.create(email: 'testino@mail.com', password: '123456', password_confirmation: '123456', name: 'test',
                    phone_number: '12334456', role: 1)
user4 = User.create(email: 'probino@mail.com', password: '123456', password_confirmation: '123456', name: 'hello',
                    phone_number: '12334456', role: 1)

# Create fake users and properties
fake_users = []
fake_properties = []

25.times do
  create_property(user0, property_urls)
end

5.times do
  user = create_user(0)
  fake_users << user

  20.times do
    create_property(user, property_urls)
  end

  2.times do
    property = create_property(user, property_urls)

    fake_properties << property

    # Create UserProperty entries for saved and contacted properties
    UserProperty.create(user: user2, property:, saved: true, contacted: true)
    UserProperty.create(user: user3, property:, saved: true, contacted: false)
    UserProperty.create(user: user4, property:, saved: false, contacted: true)
  end
end

user = create_user(0)
fake_users << user

10.times do
  property_contacted = create_property(user, property_urls)
  fake_properties << property_contacted
  UserProperty.create(user: user2, property: property_contacted, saved: false, contacted: true)
end

puts 'Fake data created successfully.'
