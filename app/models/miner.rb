class Miner
  include ActiveAttr::Model

  attribute :citySelect
  attribute :limitSelect
  attribute :countryCode
  attribute :starRating

  attr_accessible :citySelect, :limitSelect, :countryCode, :starRating

  validates_presence_of :citySelect, :limitSelect, :countryCode, :starRating
end
