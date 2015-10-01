# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

ActiveRecord::Base.transaction do
  listings = []
  CSV.foreach('public/listings.csv', :headers => true) do |row|
    listings << Listing.new(row.to_hash)
  end
  Listing.import listings
end
