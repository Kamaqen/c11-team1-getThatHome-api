require 'faker'

# Elimina todos los usuarios y propiedades existentes antes de crear nuevos registros
Property.destroy_all
User.destroy_all

5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 1,
  )  
end


# Crear usuarios ficticios
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: '123456',
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 0,
  )  

  # Crear propiedades ficticias para cada usuario
 
  2.times do
    Property.create!(
      rent_value: Faker::Number.between(from: 500, to: 5000),
      bedrooms: Faker::Number.between(from: 1, to: 5),
      bathrooms: Faker::Number.between(from: 1, to: 3),
      property_type: Faker::Number.between(from: 0, to: 1),
      operation_type: Faker::Number.between(from: 0, to: 1),
      urls: ["https://www.freepik.es", "https://www.freepik.es", "https://www.freepik.es"],
      description: Faker::Lorem.sentence,
      address: Faker::Address.full_address,
      pet_friendly: Faker::Boolean.boolean,
      area: Faker::Number.between(from: 50, to: 200),
      property_price: Faker::Number.between(from: 50000, to: 500000),
      maintenance_price: Faker::Number.between(from: 100, to: 1000),
      is_active: Faker::Boolean.boolean,
      user: user
    )
  end
end

# Crear usuarios adicionales
User.create(email: 'test@mail.com', password: '123456', name: 'testino', phone_number: '555555')
User.create(email: 'hello@mail.com', password: '123456', name: 'hello', phone_number: '12334456')

puts 'Datos ficticios creados con éxito.'