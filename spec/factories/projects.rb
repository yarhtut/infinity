FactoryGirl.define do
  factory :project do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }

    trait :jobs do
      after(:create) do |project|
        create_list(:job, 2, project: project)
      end
    end
  end
end