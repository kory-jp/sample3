FactoryBot.define do
  factory :user do
    name {"sample"}
    sequence(:mail) { |n| "sample#{n}@example.com"}
    password {"password"}
  end
end
