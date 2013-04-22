require 'json'
require 'open-uri'

class HotelsController < ApplicationController

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(params[:hotel])
    if @hotel.save
      redirect_to hotel_path(@hotel), :notice => "new hotel created"
    else
      render "new"
    end
  end

  def show
    @hotel =  Hotel.find(params[:id])
  end

  def index
    @hotels = Hotel.all
  end

  def mine_hotels
    @hotel = Hotel.new
    if @hotel.valid?
      Hotel.build_hotels
    else
      render 'admin/index'
    end
  end

  def destroy_hotels
    Hotel.remove_all
  end

  def mine_descriptions

  end


end
