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

  describe "POST /login" do
    it "Testing with valid credentials" do
      user = User.create(email: 'test@mail.com',
      password: '123456',
      name: 'testino',
      phone_number: '555555',
      role: "landlord")

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
