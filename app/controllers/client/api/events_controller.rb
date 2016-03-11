class Client::Api::EventsController < Client::Api::BaseController
  before_action :set_event, only: [:show]

  def index
    @events = current_user.events
  end

  def create
    @event = current_user.events.build(event_params)
    # authorize @event

    if @event.save
      render :show, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :date,
      :description,
      :number_of_guests)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

end
