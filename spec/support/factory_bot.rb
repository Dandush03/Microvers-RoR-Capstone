FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:full_name) { |n| "User#{n}" }
    email { "#{full_name}@example.com".downcase }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
