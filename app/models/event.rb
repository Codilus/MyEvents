class Event < ActiveRecord::Base

  belongs_to :client, class_name: "Client"

  validates :name, presence: true
  validates :client, presence: true
end
