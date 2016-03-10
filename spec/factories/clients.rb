FactoryGirl.define do
  factory :client do
    sequence(:first_name) { |n| "Client #{n}" }
    sequence(:last_name) { |n| "Last Name" }
    password 123123123

    type "Client"
    sequence(:email) { |n| "client#{n}@test.com" }

  end
end
