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
    @api_hotels = GetHotels({:customerIpAddress => "60.241.64.60", :customerUserAgent => "Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.4b) Gecko/20030516 Mozilla Firebird/0.6", :city => "Bangkok", :countryCode => "TH", :numberOfResults => "10", :minStarRating => "4.0"})
    @response_body = @api_hotels.body
  end

end
