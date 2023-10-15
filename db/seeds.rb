require 'faker'

# Eliminate all existing user_properties, properties, and users before creating new records
UserProperty.destroy_all
Property.destroy_all
User.destroy_all

# Create fixed users
user1 = User.create(email: 'test@mail.com', password: '123456', name: 'testino', phone_number: '555555', role: 0)
user2 = User.create(email: 'hello@mail.com', password: '123456', name: 'hello', phone_number: '12334456', role: 1)

# Create fake users and properties
fake_users = []
fake_properties = []

5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 1,
  )
  fake_users << user
end

5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 0,
  )
  fake_users << user

  2.times do
    property = Property.create!(
      rent_value: Faker::Number.between(from: 500, to: 5000),
      bedrooms: Faker::Number.between(from: 1, to: 5),
      bathrooms: Faker::Number.between(from: 1, to: 3),
      property_type: Faker::Number.between(from: 0, to: 1),
      operation_type: Faker::Number.between(from: 0, to: 1),
      urls: ["https://img.freepik.com/fotos-premium/moderna-acogedora-casa-estilo-lujoso-piscina-estacionamiento-generado-ai_859483-3864.jpg?w=2000"],
      description: Faker::Lorem.sentence,
      address: Faker::Address.full_address,
      pet_friendly: Faker::Boolean.boolean,
      area: Faker::Number.between(from: 50, to: 200),
      property_price: Faker::Number.between(from: 50000, to: 500000),
      maintenance_price: Faker::Number.between(from: 100, to: 1000),
      is_active: Faker::Boolean.boolean,
      user: user
    )
    fake_properties << property

    # Create UserProperty entries for saved and contacted properties
    UserProperty.create(user: user1, property: property, saved: true, contacted: true)
    UserProperty.create(user: user2, property: property, saved: true, contacted: false)
    UserProperty.create(user: user, property: property, saved: true, contacted: false)
  end
end

puts 'Fake data created successfully.'
