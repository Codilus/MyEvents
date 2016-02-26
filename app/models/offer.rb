class Offer < ActiveRecord::Base
  belongs_to :event
  belongs_to :promoter

  validates :event, presence: true
  validates :promoter, presence: true
end
