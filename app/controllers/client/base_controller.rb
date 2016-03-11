class Client::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  

end
