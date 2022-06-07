class DashboardsController < ApplicationController
  def wishlist
    @sneaker = Wishlist.where(user: current_user)
    total = 0
    @sneaker.each do |sneaker|
      total += Price.where(sneaker: sneaker.sneaker).last.price
    end
    @total = total
  end

  def collection
    @sneaker = Collection.where(user: current_user)
    total = 0
    @sneaker.each do |sneaker|
      total += Price.where(sneaker: sneaker.sneaker).last.price
    end
    @total = total
  end

  def profile
  end
end
