FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "MyString" }
    password_confirmation { "MyString" }
    api_key { "MyString" }
  end
end
