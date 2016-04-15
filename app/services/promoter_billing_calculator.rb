class PromoterBillingCalculator
  MONTH_FEE = 20.00
  EVENT_FEE = 10.00
  OFFER_FEE = 1.00
  PROCESS_FEE = 0.05

  def initialize(promoter, month, year)
    @promoter = promoter
    @month = month
    @year = year
  end

  def total_usage_in_hours
    (Time.now - @promoter.created_at) / 3600
  end

  def total_bill
    @total_bill ||= calculate
  end

  def events_counter
    @events_counter ||= @month + 2
  end

  def offers_counter
    @offers_counter ||= (@month + 2)*2
  end

  def offers_bill
    @offers_bill ||= offers_counter * OFFER_FEE
  end

  def events_bill
    @events_bill ||= EVENT_FEE * events_counter
  end

  def process_usage_count
    return @process_usage_count if @process_usage_count
    usage = @promoter.get_usage(@month, @year)

    @process_usage_count = usage.process_usage if usage
    @process_usage_count = 0 unless usage

    @process_usage_count
  end

  def process_usage_bill
    @process_usage_bill ||= process_usage_count * PROCESS_FEE
  end

  private

  def calculate
    total = MONTH_FEE
    total += events_bill
    total += offers_bill
    total += process_usage_bill

    total
  end
end
