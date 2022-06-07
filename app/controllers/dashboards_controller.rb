class DashboardsController < ApplicationController
  def wishlist
    @sneaker = Wishlist.where(user: current_user)
  end

  def collection
    @sneaker = Collection.where(user: current_user)
  end

  def profile
  end
end
