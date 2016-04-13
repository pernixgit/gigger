require 'faker'

FactoryGirl.define do
  factory :band do
    name { Faker::Lorem.name }
    phone { Faker::PhoneNumber.phone_number }
  end
end
