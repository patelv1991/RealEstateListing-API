class ListingsController < ApplicationController
  def index
    @listings = Listing.filter_results(listing_params(params))
    render :index 
    # paginate json: @listings
    # render json: @listings
  end

  private
    def listing_params(params)
      params.slice(:min_price, :max_price,
                   :min_bed, :max_bed,
                   :min_bath, :max_bath,
                   :min_sqft, :max_sqft)
    end

end
