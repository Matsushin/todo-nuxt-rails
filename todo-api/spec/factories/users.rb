FactoryBot.define do
  factory :user do
    username { 'テストユーザ' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
  end
end
