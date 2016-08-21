FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'example'
  end
end
