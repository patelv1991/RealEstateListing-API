# [Real Estate Listing Rails API][link]

- [Live Link][link]

[link]: https://real-estate-listing-api.herokuapp.com/

## What is it?
This is an API endpoint that returns a filtered set of listings from the data provided [here](https://s3.amazonaws.com/opendoor-problems/listings.csv)

## How to access it?
GET /listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&min_bath=2&max_bath=2

### Possible Query Keys
- min_price: The minimum listing price in dollars.
- max_price: The maximum listing price in dollars.
- min_bed: The minimum number of bedrooms.
- max_bed: The maximum number of bedrooms.
- min_bath: The minimum number of bathrooms.
- max_bath: The maximum number of bathrooms.
- min_sqft: The minimum square footage.
- max_sqft: The maximum square footage.
- *Note*: All query parameters are optional, all minimum and maximum fields are inclusive (e.g. min_bed=2&max_bed=4 will return listings with 2, 3, or 4 bedrooms).

### Examples
- [Example 1](https://real-estate-listing-api.herokuapp.com/listings?min_price=200000&max_price=201000&min_bed=5)
- [Example 2](https://real-estate-listing-api.herokuapp.com/listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&min_bath=2&max_bath=2)
- [Example 3](https://real-estate-listing-api.herokuapp.com/listings?min_price=250000&max_price=400000&min_bed=5&min_bath=3)
- [Example 4](https://real-estate-listing-api.herokuapp.com/listings?min_price=350000&max_price=400000&min_bed=2&min_bath=4)

## Key Features
- Uses `activerecord-import` gem to bulk insert data using ActiveRecord.
- Uses ActiveRecord Scopes to filter data.

## Future Development
- Paginate the results to improve load time for large data set.
- Render error messages when invalid queries are performed (e.g. when min value provided is larger than max value).
- Add a search form that allows users to query data.
- Add other CRUD operations like create / update / delete to modify the listings
