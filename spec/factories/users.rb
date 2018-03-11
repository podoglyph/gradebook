FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
    email {Faker::Internet.unique.email}
    role 0
    password "password"
  end
end
