json.array! @listings do |listing|
  json.extract! listing, :id, :street, :status, :price, :bedrooms,
                         :bathrooms, :sq_ft, :lat, :lng, :created_at,
                         :updated_at
end
