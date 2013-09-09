class BookingsController < ApplicationController
  def new
    @matches = Hotel.search_availability
    @results = Kaminari.paginate_array(@matches).page(params[:page]).per(10)
    render :new
  end
end
