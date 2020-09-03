# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'UserRepository' do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { nil }

    trait :with_password_confirmation do
      password_confirmation { password }
    end
  end
end
