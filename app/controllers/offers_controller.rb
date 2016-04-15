class OffersController < ActionController::Base

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	has_scope :by_promoter_id
	has_scope :by_client_id
	has_scope :by_event_id

	def index
		@offers = apply_scopes(Offer).all
	end

	def create
		event = Event.find(create_permitted_params[:event_id])
		promoter = Promoter.find(create_permitted_params[:promoter_id])
		@offer = Offer.new(event: event, promoter: promoter)

		@offer.increase_client_process

		if @offer.save
			render json: @offer
		else
			render_error_message "Não foi possível solicitar o orçamento"
		end
	end

	def update_budget
		@offer = Offer.find(params[:id])

		@offer.increase_promoter_process

		if @offer.update_budget(update_budget_permitted_params)
			render json: @offer
		else
			render_error_message "Não foi possível criar o orçamento"
		end
	end

	def show
		@offer = Offer.find(params[:id])
	end

	def accept_budget
		begin
			@offer = Offer.find(params[:id])
			@offer.increase_client_process
			@offer.accept_budget!
			render json: @offer
		rescue => e
			render_error_message "Não foi possível aceitar o orçamento"
		end
	end

	def refuse_budget
		begin
			@offer = Offer.find(params[:id])
			@offer.increase_client_process
			@offer.refuse_budget!
			render json: @offer
		rescue => e
			render_error_message "Não foi possível recusar o orçamento"
		end
	end

	private
	def create_permitted_params
		params.fetch(:offer).permit(:event_id, :promoter_id)
	end

	def update_budget_permitted_params
		params.fetch(:offer).permit(:budget_price, :budget_description)
	end

	def render_error_message message
		render json: { message: message }, status: 400
	end

end
