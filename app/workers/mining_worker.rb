class MiningWorker
  include Sidekiq::Worker

  def perform(citySelect, limitSelect, countryCode, starRating)
    HotelPreview.build_hotels(citySelect, limitSelect, countryCode,
      starRating)
  end
end
