class ImageResizer
  @queue = :images_queue
  def self.perform(hotel_id)
    hotel = Hotel.find(hotel_id)

    # image processing code goes here

  end
end
