class Event < ActiveRecord::Base

  belongs_to :client, class_name: "Client"
  has_many :offers

  validates :name, presence: true
  validates :client, presence: true

  scope :created_between, ->(start_date, end_date) {where(created_at: start_date..end_date)}
end
