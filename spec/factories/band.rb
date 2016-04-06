require 'faker'

FactoryGirl.define do
  factory :band do
    after(:build) { |b| b.password_confirmation = b.password }

    name { Faker::Lorem.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password(10) }
  end
end
