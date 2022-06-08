class WishlistsController < ApplicationController
  before_action :authenticate_user!

  def new
    @sneaker = Sneaker.find(params[:sneaker_id])
    @wishlist = Wishlist.new
  end

  def create
    @sneaker = Sneaker.find(params[:sneaker_id])
    @user = current_user
    @wishlist = Wishlist.new(user: @user, sneaker: @sneaker)
    if @wishlist.save
      flash[:notice] = "Sneaker added to your wishlist!"
      redirect_to wishlist_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to wishlist_path
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to wishlist_path
  end

  def update
    wish = Wishlist.find(params['id'])
    wish.price_alert = params['wishlist']['price_alert']
    if wish.save!
      redirect_to wishlist_path
    else
      render wishlist_path
    end
  end
end
