class AdminController < ApplicationController

  def new
    @miner = Miner.new
  end

  def index
    @miner = Miner.new
  end

  def mine_hotels
    @admin = Admin.new(params[:admin])
    if @admin.valid?
      Hotel.build_hotels
    else
      render '/admin/index'
    end
  end

end
