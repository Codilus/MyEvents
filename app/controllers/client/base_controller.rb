class Client::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :authenticate_client!
end
