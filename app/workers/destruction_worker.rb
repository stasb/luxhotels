class DestructionWorker
  include Sidekiq::Worker

  def perform
    Hotel.all.destroy
    HotelPreview.all.destroy
  end
end
