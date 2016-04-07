require 'faker'

FactoryGirl.define do
  factory :user do
    after(:build) { |b| b.password_confirmation = b.password }

    email { Faker::Internet.email }
    password { Faker::Internet.password(10) }
  end
end
