class Event < ActiveRecord::Base

  belongs_to :client, class_name: "Client"
  has_many :offers

  validates :name, presence: true
  validates :client, presence: true
end
