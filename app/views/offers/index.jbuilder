json.array! @offers do |offer|
	json.id offer.id
	json.client offer.event.client, :name, :email
	json.event offer.event, :id, :name
	json.status offer.status
	json.budget_price offer.budget_price
	json.event_id offer.event_id
	json.promoter offer.promoter, :name
end
