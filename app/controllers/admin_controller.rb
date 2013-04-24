class AdminController < ApplicationController

  def index
    @miner = Miner.new
  end

end
