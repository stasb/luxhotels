class AdminController < ApplicationController

  before_filter :authenticate_user!
  before_filter do
    unless current_user.admin?
      flash[:error] = "You must be an administrator to access the admin page."
      redirect_to root_path
    end
  end

  def index
    @miner = Miner.new
  end

end
