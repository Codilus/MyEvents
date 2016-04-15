class Client::Api::BaseController < Client::BaseController
  after_action :count_process_client

  private

  def count_process_client
    current_user.current_usage.increment_usage!
  end
end
