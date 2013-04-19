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
  end

  def mine_hotels
    Hotel.build_hotels
  end

  def destroy_hotels

  end

  def mine_descriptions

  end


end
