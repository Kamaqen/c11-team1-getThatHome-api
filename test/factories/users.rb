FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}_#{Faker::Internet.email}" }
    password {'123456'} 
    name {'testino'} 
    phone_number {'555555'} 
    role {"landlord"}
  end
end
