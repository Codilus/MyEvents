json.array! @offers do |offer|
	json.id offer.id
	json.client offer.event.client, :name, :email
	json.status offer.status
end
