class Offer < ActiveRecord::Base
  belongs_to :event
  belongs_to :promoter

  scope :by_promoter_id, -> id do
    includes(event: [:client]).where(promoter_id: id)
  end

  scope :by_client_id, -> id do
    Client.find(id).events.map { |event| event.offers }.flatten
  end

  validates :event, presence: true
  validates :promoter, presence: true
end
