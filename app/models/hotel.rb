class Hotel
  include Mongoid::Document
  include Mongoid::FullTextSearch

  paginates_per 10

  before_create :build_city
  belongs_to :city

  mount_uploader :image, HotelImageUploader
  mount_uploader :thumb_image, HotelImageUploader

  field :name, type: String

  field :leader, type: Boolean, default: false

  index( { 'HotelSummary.name' => 1}, { unique: true, name: 'name_index' } )

  def search_name
    self['HotelSummary']['name']
  end

  fulltext_search_in :search_name

  def self.build_complete_hotels(fetched_hotels, city_name, country_code)

    fetched_hotels.each do |hotel|
      if Hotel.where("HotelSummary.hotelId" => hotel.hotelId).count == 0
        api_info = GetInfo({:customerIpAddress => "60.241.64.60",\
                                :customerUserAgent => "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b)\
                                Gecko/20030516 Mozilla Firebird/0.6",\
                                :customerSessionId => "test_user",\
                                :locale => "en_US", :currencyCode => "USD", :hotelId => hotel.hotelId,\
                                :options => "0"})

        hotel_data = api_info.body['HotelInformationResponse']
        city = City.build_city(city_name, country_code)
        hotel = city.hotels.create(hotel_data)
        city.hotels << hotel
        hotel.process_image(hotel)
      end
    end
  end

  def process_image(hotel)
    first_image = hotel['HotelImages']['HotelImage'][0]['url']
    hotel.remote_image_url = first_image.to_s
    hotel['image'] = hotel.image_url
    hotel['thumb_panel'] = hotel.image_url(:thumb_panel)
    hotel['thumb_search'] = hotel.image_url(:thumb_search)
    hotel.save
  end
end
