class Region
  include Mongoid::Document

  field :region_code, type: String
  field :name, type: String

  has_many :countries

  def self.exists?(region_code)
    return true if Region.find_by(region_code: region_code) != nil
  end

  def self.build_region(country_code)
    geodata = Geodata.find_by(country_code: country_code)

    if Region.exists?(geodata['continent_code'])
      region = Region.find_by(region_code: geodata['continent_code'])
    else
      region = Region.create(name: geodata['continent_name'], region_code: geodata['continent_code'])
    end
    return region
  end

  def active_hotels
    countries = Region.where(name: self.name).first.countries
    cities = City.all.select do |city|
      countries.include?(city.country)
    end
    hotels = Hotel.all.select do |hotel|
      cities.include?(hotel.city)
    end
    hotels
  end
end
