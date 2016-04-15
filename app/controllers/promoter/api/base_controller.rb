class Promoter::Api::BaseController < Promoter::BaseController
  # respond_to :json
  after_action :count_process_promoter
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  # def current_laboratory
  #   current_operator.laboratory
  # end
  #
  # def pundit_user
  #   current_operator
  # end
  #

  def count_process_promoter
    current_user.current_usage.increment_usage!
  end
end
