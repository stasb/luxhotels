module SearchHotel

  def GetHotels(options)
    api = Expedia::Api.new
    api.get_list(options)
  end

  def GetInfo(options)
    api = Expedia::Api.new
    api.get_information(options)
  end

end
