require 'faker'

FactoryGirl.define do
  factory :event do
    name { Faker::Name.first_name }
    description { Faker::StarWars.quote }
    date { Faker::Date.forward(23) }
    time { Faker::Time.forward(23, :morning) }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
