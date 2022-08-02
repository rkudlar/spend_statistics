FactoryBot.define do
  factory :record do
    cost { Faker::Number.decimal(l_digits: 2) }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    association :category
    association :user
  end
end
