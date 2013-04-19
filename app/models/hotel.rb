class Hotel
  include Mongoid::Document
  field :hotelId, type: Integer
  field :name, type: String
  field :address1, type: String
  field :address2, type: String
  field :city, type: String
  field :stateProvinceCode, type: String
  field :countryCode, type: String
  field :postalCode, type: String
  field :airportCode, type: String
  field :supplierType, type: String
  field :propertyCategory, type: String
  field :hotelRating, type: Float
  field :confidenceRating, type: Integer
  field :amenityMask, type: Integer
  field :shortDescription, type: String
  field :locationDescription, type: String
  field :lowRate, type: String
  field :highRate, type: String
  field :rateCurrencyCode, type: String
  field :latitude, type: Float
  field :longitude, type: Float
  field :proximityDistance, type: Float
  field :proximityUnit, type: Float
  field :hotelDestination, type: Boolean
  field :thumbNailUrl, type: String
  field :deepLink, type: String

  mount_uploader :image, HotelImageUploader
end
