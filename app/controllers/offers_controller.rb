class OffersController < ActionController::Base

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	has_scope :by_promoter_id

	def index
		@offers = apply_scopes(Offer).all
	end

	def create
		@offer = Offer.new(permitted_params)

		if @offer.save
			render json: @offer
		else
			# Show error message
		end
	end

	def show
		@offer = Offer.find(params[:id])
	end

	private
	def permitted_params
		params.fetch(:offer).permit(:event_id, :promoter_id)
	end

end
