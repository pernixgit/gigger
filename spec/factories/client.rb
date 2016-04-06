require 'faker'

FactoryGirl.define do
  factory :client do
    after(:build) { |b| b.password_confirmation = b.password }

    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification { Faker::Number.number(9) }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password(10) }
  end
end
