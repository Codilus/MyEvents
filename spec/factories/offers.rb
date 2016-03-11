FactoryGirl.define do
  factory :offer do
    event
    promoter
    budget_price 123.45
    budget_description "This is the budget description"
    status "PENDING_BUDGET"

    factory :offer_pending_confirmation do
      status "PENDING_CONFIRMATION"
    end

    factory :offer_refused do
      status "REFUSED"
    end

    factory :offer_confirmed do
      status "CONFIRMED"
    end

    factory :offer_finished do
      status "FINISHED"
    end
  end
end
