require 'rails_helper'
require 'faker'

RSpec.describe "Controllers: User, Properties and Sessions", type: :request do
  
  describe "POST /controllers/users" do
    it "Create new user" do
      post users_path, params: {
          email: 'test@mail.com',
          password: '123456',
          name: 'testino',
          phone_number: '555555',
          role: "landlord"
      }
      expect(response).to have_http_status(201)
      #puts response.body
    end
  end

  describe "POST/property" do 
    it "testing" do
      user = FactoryBot.create(:user)

      post properties_path, params: {
        "rent_value" => 15,
        "bedrooms" => 5,
        "bathrooms" => 5,
        "property_type" => "house",
        "operation_type" => "rent",
        "urls" =>  ["www.login.com"],
        "description" => "Faker::Lorem.sentence",
        "address" => "Faker::Address.full_address",
        "pet_friendly" => true,
        "area" => "hola",
        "property_price" => 5000,
        "maintenance_price" => 5000,
        "is_active" => true,
        "user_id" => user.id,
      }.to_json, headers: { 
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{user.token}"  # Aquí se agrega el token en el encabezado
      }
      expect(response).to have_http_status(200)  # Cambiado a 201 según tu comentario anterior
    end
  end

  describe "POST /login" do
    it "Testing with valid credentials" do
      user = FactoryBot.create(:user)

      post login_path, params: { email: user.email, password: '123456' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include('token', 'role')
    end

    it "Testing with invalid credentials" do
      post login_path, params: { email: 'jorgeJr@mail.com', password: '123456' }
      expect(response).to have_http_status(401)
      expect(response.body).to include('Incorrect email or password')
    end
  end

  describe "GET /controllers/properties" do
    it "Get all properties" do
      get  properties_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /controllers/properties" do
    it "Get a especific property" do
      get  property_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
