class OffersController < ActionController::Base

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	has_scope :by_promoter_id
	has_scope :by_client_id

	def index
		@offers = apply_scopes(Offer).all
	end

	def create
		@offer = Offer.new(create_permitted_params)

		if @offer.save
			render json: @offer
		else
			# Show error message
		end
	end

	def update
		@offer = Offer.find(params[:id])

		if @offer.update(update_permitted_params)
			render json: @offer
		else
			# Show error message
		end
	end

	def update_budget
		@offer = Offer.find(params[:id])

		if @offer.update_budget(update_budget_permitted_params)
			render json: @offer
		else
			# Show error message
		end
	end

	def show
		@offer = Offer.find(params[:id])
	end

	private
	def create_permitted_params
		params.fetch(:offer).permit(:event_id, :promoter_id)
	end

	def update_budget_permitted_params
		params.fetch(:offer).permit(:budget_price, :budget_description)
	end

end
