class Offer < ActiveRecord::Base
  DEFAULT_VALUES = {
    status: "PENDING_BUDGET"
  }

  VALID_STATUS = %w(PENDING_BUDGET PENDING_CONFIRMATION REFUSED CONFIRMED FINISHED)

  belongs_to :event
  belongs_to :promoter

  scope :by_promoter_id, -> id do
    includes(event: [:client]).where(promoter_id: id)
  end

  scope :by_client_id, -> id do
    includes(event: [:client]).where(event: Client.find(id).events)
  end

  scope :by_event_id, -> id { includes(event: [:client]).where(event_id: id) }

  validates :event, presence: true
  validates :promoter, presence: true
  validates :status, inclusion: { in: VALID_STATUS }

  def initialize(attributes={})
    attr_with_defaults = DEFAULT_VALUES.merge(attributes)
    super(attr_with_defaults)
  end

  def update_budget data
    update(data.merge(status: 'PENDING_CONFIRMATION',
                      budget_counter: self.budget_counter + 1))
  end

  def accept_budget!
    self.status = 'CONFIRMED'
    self.save!
  end

  def refuse_budget!
    self.status = 'REFUSED'
    self.save!
  end

end
