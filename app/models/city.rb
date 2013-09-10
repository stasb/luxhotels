class City
  include Mongoid::Document

  field :name, type: String
  field :country_code, type: String

  belongs_to :country
  has_many :hotels

  def self.build_city(city_name, country_code)
    name = city_name
    country_code = country_code

    if City.exists?(name)
      city = City.find_by(name: name)
    else
      country = Country.build_country(country_code)
      city = country.cities.create(name: name, country_code: country_code)
    end
    return city
  end

  def self.exists?(name)
    return true if City.find_by(name: name) != nil
  end
end
