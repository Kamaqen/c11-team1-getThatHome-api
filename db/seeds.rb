require 'faker'

# Elimina todos los usuarios y propiedades existentes antes de crear nuevos registros
User.destroy_all
Property.destroy_all

# Crear usuarios ficticios
10.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number
  )
  user.properties.destroy_all
  # Crear propiedades ficticias para cada usuario
  5.times do
    Property.create!(
      rent_value: Faker::Number.between(from: 500, to: 5000),
      bedrooms: Faker::Number.between(from: 1, to: 5),
      bathrooms: Faker::Number.between(from: 1, to: 3),
      property_type: Faker::Lorem.word,
      contract_type: Faker::Lorem.word,
      image: Faker::Placeholdit.image,
      description: Faker::Lorem.sentence,
      address: Faker::Address.full_address,
      pet_friendly: Faker::Boolean.boolean,
      area: Faker::Number.between(from: 50, to: 200),
      property_price: Faker::Number.between(from: 50000, to: 500000),
      maintenance_price: Faker::Number.between(from: 100, to: 1000),
      user: user,
      is_active: Faker::Boolean.boolean
    )
  end
end

# Crear usuarios adicionales
User.create(email: 'test@mail.com', password: '123456', name: 'testino', phone_number: '555555')
User.create(email: 'hello@mail.com', password: '123456', name: 'hello', phone_number: '12334456')

puts 'Datos ficticios creados con éxito.'