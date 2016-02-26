class Client < User

  has_many :events
  has_many :offers, through: :events

end
