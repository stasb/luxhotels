class MinersController < ApplicationController
  layout 'admin_layout'

  before_filter :authenticate_user!

  before_filter do
    redirect_to :new_user_session_path unless current_user && current_user.admin?
  end

  def mine_hotels
    @miner = Miner.new(params[:miner])
    if @miner.valid?
      MiningWorker.perform_async(@miner.citySelect, @miner.limitSelect, @miner.countryCode,
        @miner.starRating)

    redirect_to admin_path, flash: { notice: 'Hotels are building...' }
    else
      render '/admin/index'
    end
  end

  def construct_hotels
    Hotel.build_complete_hotels
  end

  def destroy_hotels
    @miner = Miner.new(params[:miner])
    if @miner.valid?
      HotelPreview.where(city: @miner.citySelect).gte(hotelRating: @miner.starRating).\
                                                       limit(@miner.limitSelect).destroy

      Hotel.where("HotelSummary.city" => @miner.citySelect).gte("HotelSummary.hotelRating" => @miner.starRating.to_f).\
        limit(@miner.limitSelect).destroy
    else
      render '/admin/index'
    end
  end

  def destroy_all_hotels
    DestructionWorker.perform_async
    redirect_to root_path, flash: { notice: 'Deleting all hotels...' }
  end

  def build_countries
    Country.build_list
  end

  def build_cities
    City.build_list
  end
end
