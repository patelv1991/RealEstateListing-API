class Listing < ActiveRecord::Base
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
    convert_to_geojson_object(listings)
  end

  private
    def self.convert_to_geojson_object(listings)
      geo_objects = []
      listings.each do |listing|
        feature = {}
        feature['geometry'], feature['properties'] = {}, {}
        get_coordinates(feature, listing)
        get_properties(feature, listing)
        geo_objects << feature
      end
      geo_objects
    end

    def self.get_coordinates(feature, listing)
      feature['geometry']['coordinates'] = [listing.lat, listing.lng]
    end

    def self.get_properties(feature, listing)
      feature['properties']['id'] = listing.id
      feature['properties']['price'] = listing.price
      feature['properties']['street'] = listing.street
      feature['properties']['bedrooms'] = listing.bedrooms
      feature['properties']['bathrooms'] = listing.bathrooms
      feature['properties']['sq_ft'] = listing.sq_ft
    end
end
