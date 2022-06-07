class WishlistsController < ApplicationController
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
end
