class Hotel
  include Mongoid::Document
  field :hotel_id, type: Integer
  field :name, type: String
  field :address, type: String
  field :city, type: String
  field :country_code, type: Integer
  mount_uploader :image, HotelImageUploader
end
