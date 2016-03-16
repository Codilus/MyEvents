json.id @offer.id
json.client @offer.event.client, :name, :email
json.promoter @offer.promoter, :name, :email
json.event @offer.event
json.status @offer.status
json.budget_price @offer.budget_price
json.budget_description @offer.budget_description
