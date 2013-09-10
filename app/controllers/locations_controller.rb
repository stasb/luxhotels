class LocationsController < ApplicationController
  def countries
    @active_cities = City.all.select do |city|
      city.hotels.exists?
    end

    @active_countries = Country.all.select do |country|
      country.cities.any? do |city|
        city.hotels.exists?
      end
    end

    @active_regions = Region.all.select do |region|
      region.countries.any? do |country|
        @active_countries.include?(country)
      end
    end
  end

  def cities
    @country = Country.find_by(id: params[:country_id])
    @active_cities = @country.cities.select do |city|
      city.hotels.exists?
    end
  end

  def city
    @city = City.find_by(id: params[:city_id])
    @hotels = @city.hotels.all.page(params[:page]).per(10)
  end
end
