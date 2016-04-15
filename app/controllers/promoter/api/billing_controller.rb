class Promoter::Api::BillingController < Promoter::Api::BaseController
  before_action :set_event, only: [:show]

  def index
    month = params[:month].to_i || Time.now.month
    year = params[:year].to_i || Time.now.year

    @promoter_billing_calculator = PromoterBillingCalculator.new(current_user, month, year)
  end

end
