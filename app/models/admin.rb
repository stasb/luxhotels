class Admin
  include ActiveAttr::Model

  attribute :citySelect
  attribute :limitSelect

  attr_accessible :citySelect, :limitSelect

  validates_presence_of :citySelect, :limitSelect
end
