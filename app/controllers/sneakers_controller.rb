class SneakersController < ApplicationController
  def index
    @sneakers = Sneaker.all
    @prices = Price.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end
end
