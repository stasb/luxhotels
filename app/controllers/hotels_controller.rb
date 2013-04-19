require 'json'
require 'open-uri'

class HotelsController < ApplicationController
  include SearchHotel

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(params[:hotel])
    if @hotel.save
      redirect_to hotel_path(@hotel), :notice => "new hotel created"
    else
      render "new"
    end
  end

  def show
    @hotel =  Hotel.find(params[:id])
  end

  def index
    @hotels = Hotel.all

    api = Expedia::Api.new

    api_hotels = api.get_list({:customerIpAddress => "60.241.64.60",\
                             :customerUserAgent => "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b)\
                             Gecko/20030516 Mozilla Firebird/0.6",\
                             :city => "Bangkok", :countryCode => "TH", :numberOfResults => "50", :minStarRating => "4.0"})

    @api_hotels_hash = api_hotels.body

    hotel_objects = api_hotels.body['HotelListResponse']['HotelList']['HotelSummary']

    hotel_objects.first(5).each do |f|
      existing_hotels = Hotel.where(hotelId: f.fetch("hotelId")).count
      if existing_hotels == 0
        existing_thumb = f["thumbNailUrl"].to_s
        large_image_url = "http://images.travelnow.com" + existing_thumb.sub("_t.jpg","_b.jpg")
        @hotel = Hotel.create(f)
        @hotel.remote_image_url = large_image_url
        @hotel.save
      end
    end

  end

end
