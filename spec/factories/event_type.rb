require 'faker'

FactoryGirl.define do
  factory :event_type do
    name { Faker::Name.name }
  end
end
