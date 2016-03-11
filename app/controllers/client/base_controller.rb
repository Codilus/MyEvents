class Client::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_client!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :first_name, :type) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:last_name, :first_name) }
  end

end
