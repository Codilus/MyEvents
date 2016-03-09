FactoryGirl.define do
  factory :event do
		sequence(:name) { |n| "Evento #{n}" }
		association :client
  end
end
