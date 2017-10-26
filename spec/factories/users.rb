FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { '123456' }
    admin    { false }
    first_name  { Faker::Name.name}
    last_name   { Faker::Name.name}
  end
end
