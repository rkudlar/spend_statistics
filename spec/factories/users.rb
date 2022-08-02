FactoryBot.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password(min_length: 8) }

    trait :with_invalid_email do
      email { '' }
    end

    trait :with_invalid_password do
      password { '' }
    end
  end
end
