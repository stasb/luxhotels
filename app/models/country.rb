class Country
  include Mongoid::Document

  field :country_code, type: String
  field :name, type: String

  belongs_to :region
  has_many :cities

  def self.exists?(country_code)
    return true if Country.find_by(country_code: country_code) != nil
  end

  def self.build_country(country_code)
    if Country.exists?(country_code)
      country = Country.find_by(country_code: country_code)
    else
      region = Region.build_region(country_code)
      geodata = Geodata.find_by(country_code: country_code)
      country = region.countries.create(name: geodata['country_name'], country_code: country_code)
    end
    return country
  end
end
