class Hotel
  include Mongoid::Document

  mount_uploader :image, HotelImageUploader

  def self.build_complete_hotels

    HotelPreview.each do |h|
      api_info = GetInfo({:customerIpAddress => "60.241.64.60",\
                               :customerUserAgent => "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b)\
                               Gecko/20030516 Mozilla Firebird/0.6",\
                               :customerSessionId => "test_user",\
                               :locale => "en_US", :currencyCode => "USD", :hotelId => h.hotelId,\
                               :options => "0"})

      hotel_information = api_info.body['HotelInformationResponse']
      hotel = Hotel.create(hotel_information)

      # image_hash = hotel_information['HotelImages']['HotelImage']

      # image_hash.each do |image|
      #   hotel.remote_image_url = image['url'].to_s
      #   hotel.save
      # end

    end

  end

end
