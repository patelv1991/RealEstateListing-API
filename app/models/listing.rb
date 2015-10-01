class Listing < ActiveRecord::Base
  paginates_per 20
  scope :min_price, -> (min_price) { where("price >= ?", min_price) }
  scope :max_price, -> (max_price) { where("price <= ?", max_price) }
  scope :min_bed, -> (min_bed) { where("bedrooms >= ?", min_bed) }
  scope :max_bed, -> (max_bed) { where("bedrooms <= ?", max_bed) }
  scope :min_bath, -> (min_bath) { where("bathrooms >= ?", min_bath) }
  scope :max_bath, -> (max_bath) { where("bathrooms <= ?", max_bath) }
  scope :min_sqft, -> (min_sqft) { where("sq_ft >= ?", min_sqft) }
  scope :max_sqft, -> (max_sqft) { where("sq_ft <= ?", max_sqft) }

  def self.filter_results(params)
    listings = Listing.all
    params.each do |key, value|
      listings = listings.public_send(key, value)
    end
    listings
  end

end
