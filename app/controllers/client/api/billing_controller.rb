class Client::Api::BillingController < Client::Api::BaseController
  before_action :set_event, only: [:show]

  def index
    month = params[:month].to_i || Time.now.month
    year = params[:year].to_i || Time.now.year

    @client_billing_calculator = ClientBillingCalculator.new(current_user, month, year)
  end

end
