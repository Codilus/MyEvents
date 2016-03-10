class Offer < ActiveRecord::Base
  belongs_to :event
  belongs_to :promoter

  scope :by_promoter_id, -> id { includes(event: [:client]).where(promoter_id: id) }

  validates :event, presence: true
  validates :promoter, presence: true
end
