class HotelSummary
  include Mongoid::Document
  include Mongoid::FullTextSearch

  field :name, type: String

  embedded_in :hotel

  fulltext_search_in :name
end
