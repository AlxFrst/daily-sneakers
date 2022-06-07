class CollectionsController < ApplicationController
  def new
    @sneaker = Sneaker.find(params[:sneaker_id])
    @collection = Collection.new
  end

  def create
    @sneaker = Sneaker.find(params[:sneaker_id])
    @user = current_user
    @collection = Collection.new(user: @user, sneaker: @sneaker, condition: Condition.first, status: Status.first)
    if @collection.save!
      flash[:notice] = "Sneaker added to your collection!"
      redirect_to collection_path
    else
      flash[:alert] = "Something went wrong!"
      redirect_to collection_path
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collection_path
  end
end
