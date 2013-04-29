include SearchHotel

class HotelPreview
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

  def self.build_hotels(citySelect, limitSelect, countryCode, starRating)
    api_hotels = GetHotels({:customerIpAddress => "60.241.64.60",\
                             :customerUserAgent => "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b)\
                             Gecko/20030516 Mozilla Firebird/0.6",\
                             :city => citySelect, :countryCode => countryCode, :numberOfResults => "100",\
                             :minStarRating => starRating.to_f})

    if limitSelect.to_i == 0
      hotel_objects = api_hotels.body['HotelListResponse']['HotelList']['HotelSummary']
    else
      hotel_objects = api_hotels.body['HotelListResponse']['HotelList']['HotelSummary'].first(limitSelect.to_i)
    end

    @insert_counter = 0

    hotel_objects.each do |f|
      existing_hotels = HotelPreview.where(hotelId: f.fetch("hotelId")).count
      if existing_hotels == 0
        # existing_thumb = f["thumbNailUrl"].to_s
        # large_image_url = "http://images.travelnow.com" + existing_thumb.sub("_t.jpg","_b.jpg")
        hotel = HotelPreview.create(f)
        # hotel.remote_image_url = large_image_url
        hotel.save
        @insert_counter += 1
      end
    end

    Hotel.build_complete_hotels

    @insert_counter

  end

end


