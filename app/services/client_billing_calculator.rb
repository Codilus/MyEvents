class ClientBillingCalculator
  MONTH_FEE = 10.00
  EVENT_FEE = 1.00
  PROCESS_FEE = 0.01

  def initialize(client, month, year)
    @client = client
    @month = month
    @year = year
  end

  def total_usage_in_hours
    (Time.now - @client.created_at) / 3600
  end

  def total_bill
    @total_bill ||= calculate
  end

  def events_counter
    date = Date.new(@year, @month)
    @events_counter ||= Event.created_between(date, date + 1.month).count
  end

  def offers_counter
    @offers_counter ||= 6
  end

  def offers_bill
    2.00
  end

  def events_bill
    EVENT_FEE * events_counter
  end

  def process_usage_count
    return @process_usage_count if @process_usage_count
    usage = @client.get_usage(@month, @year)

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
