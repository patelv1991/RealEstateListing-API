json.type "FeatureCollection"
json.features do
  json.array! @listings do |listing|
    json.type "Feature"
    json.geometry do
      json.type "Point"
      json.coordinates listing['geometry']['coordinates']
    end
    json.properties do
      json.extract! listing['properties'], 'id', 'street', 'price', 'bedrooms',
                                           'bathrooms', 'sq_ft'
    end
  end
end
