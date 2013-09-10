class RedirectsController < ApplicationController
  def transfer
    @hotel_url = params[:hotel_url]
  end
end
