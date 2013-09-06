class DestructionWorker
  include Sidekiq::Worker

  def perform
    Hotel.all.destroy
    HotelPreview.all.destroy
    Region.all.destroy
    Country.all.destroy
    City.all.destroy
  end
end
