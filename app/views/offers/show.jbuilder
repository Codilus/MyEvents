json.id @offer.id
json.client @offer.event.client, :name, :email
json.event @offer.event
json.status @offer.status
