class SearchController < ApplicationController
  def search
    @query = params[:search]
    if @query.empty?
      @hotels = Hotel.all
    else
      @hotels = Hotel.fulltext_search(@query, { max_results: 100 })
    end

    if @hotels.empty?
      @results = nil
    else
      @results = Kaminari.paginate_array(@hotels).page(params[:page]).per(10)
    end
    render :results
  end
end
