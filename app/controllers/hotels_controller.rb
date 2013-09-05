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

    @a_countries = Region.where(name: 'Asia').first.countries
    @a_cities = City.all.select do |city|
      @a_countries.include?(city.country)
    end
    @a_hotels = Hotel.all.select do |hotel|
      @a_cities.include?(hotel.city)
    end

    @na_countries = Region.where(name: 'North America').first.countries
    @na_cities = City.all.select do |city|
      @na_countries.include?(city.country)
    end
    @na_hotels = Hotel.all.select do |hotel|
      @na_cities.include?(hotel.city)
    end

    @eu_countries = Region.where(name: 'Europe').first.countries
    @eu_cities = City.all.select do |city|
      @eu_countries.include?(city.country)
    end
    @eu_hotels = Hotel.all.select do |hotel|
      @eu_cities.include?(hotel.city)
    end
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.with(safe: true).destroy
    redirect_to root_path, notice: 'Hotel deleted.'
  end
end
