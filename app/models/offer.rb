class Offer < ActiveRecord::Base
  VALID_STATUS = %w(PENDING_BUDGET PENDING_CONFIRMATION REFUSED CONFIRMED FINISHED)

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
  validates :status, inclusion: { in: VALID_STATUS }

  def initialize(attributes=nil)
    attr_with_defaults = { status: "PENDING_BUDGET" }.merge(attributes)
    super(attr_with_defaults)
  end

  def pend_confirmation
    self.status = 'PENDING_CONFIRMATION'
  end

  def update_budget data
    pend_confirmation
    update(data)
  end

end
