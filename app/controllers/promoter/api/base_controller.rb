class Promoter::Api::BaseController < Promoter::BaseController
  # respond_to :json
  # after_action :verify_authorized
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
  # def user_not_authorized
  #   render json: { error: 'You are not authorized to perform this action' }, status: :unauthorized
  # end
end
