class MiningWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(citySelect, limitSelect, countryCode, starRating)
    HotelPreview.build_hotels(citySelect, limitSelect, countryCode,
      starRating)
  end
end
