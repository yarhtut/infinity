FactoryGirl.define do
  factory :job do
    title { Faker::Book.title }
    description { Faker::Lorem.sentence }
    status 1

    trait :project do
      after(:create) do |job|
        job.project = create(:project)
      end
    end
  end
end
