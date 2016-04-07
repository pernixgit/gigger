require 'faker'

FactoryGirl.define do
  factory :musician do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    identification { Faker::Number.number(9) }
    phone { Faker::PhoneNumber.phone_number }
  end
end
