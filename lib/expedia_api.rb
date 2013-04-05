
module SearchHotel

  def GetHotels(options)
    api = Expedia::Api.new
    api.get_list(options)
  end

end
