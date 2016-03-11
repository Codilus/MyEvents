# json.events do |json|
  json.array! @events, partial: 'client/api/_shared/event', as: :event
# end
