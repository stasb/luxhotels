class BookingsController < ApplicationController
  def new
    @parameters = params
    if params[:destination].blank?
      @query = []
      @hotels = Hotel.all
      @results = Kaminari.paginate_array(@hotels).page(params[:page]).per(10)
      render 'search/results'
    else
      @matches = Hotel.search_availability(params[:destination], params[:from], params[:to])
      @results = Kaminari.paginate_array(@matches).page(params[:page]).per(10)
      render :new
    end
  end
end
