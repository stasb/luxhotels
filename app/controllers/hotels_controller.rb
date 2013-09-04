require 'json'
require 'open-uri'

class HotelsController < ApplicationController

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(params[:hotel])
    if @hotel.with(safe: true).save
      redirect_to hotel_path(@hotel), notice: 'new hotel created'
    else
      render 'new'
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @city = @hotel.city
    @country = @city.country
  end

  def index
    @hotels = Hotel.page(params[:page])
    @leader = Hotel.where(leader: true).first
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.with(safe: true).destroy
    redirect_to root_path, notice: 'Hotel deleted.'
  end
end
