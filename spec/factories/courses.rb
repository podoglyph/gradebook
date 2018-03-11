FactoryBot.define do
  factory :course do
    name {Faker::Book.title}
    user nil
  end
end
