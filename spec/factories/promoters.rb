FactoryGirl.define do
  factory :promoter do
    sequence(:first_name) { |n| "Promoter #{n}" }
    sequence(:last_name) { |n| "Last Name" }
    password 123123123

    type "Promoter"
    sequence(:email) { |n| "promoter#{n}@test.com" }

  end
end
