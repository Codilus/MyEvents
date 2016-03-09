FactoryGirl.define do
  factory :offer do
    event
    promoter
    budget_price 123.45
    budget_description "This is the budget description"

    factory :offer_pending_budget do
      status "PENDING_BUDGET"
    end
  end
end
