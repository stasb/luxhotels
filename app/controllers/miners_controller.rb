class MinersController < ApplicationController

  def new
    @miner = Miner.new
  end

  def index
    @miner = Miner.new
  end

  def mine_hotels
    @miner = Miner.new(params[:miner])
    if @miner.valid?
      Hotel.build_hotels
    else
      render '/admin/index'
    end
  end

end
