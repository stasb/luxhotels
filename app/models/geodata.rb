class Geodata
  include Mongoid::Document

  field :continent_code, type: String
  field :continent_name, type: String
  field :country_code, type: String
  field :country_name, type: String
end
