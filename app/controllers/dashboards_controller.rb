class DashboardsController < ApplicationController
  def wishlist
    @sneaker = Wishlist.where(user: current_user)
    total = 0
    @sneaker.each do |sneaker|
      total += Price.where(sneaker: sneaker.sneaker).last.price
    end
    @total = total

    # Je sais c'est horrible mais j'ai pas l'time <3
    @month = Date.today.strftime("%B")
    @x_month = @month.to_time.last_month.strftime("%B")
    @xx_month = @x_month.to_time.last_month.strftime("%B")
    @xxx_month = @xx_month.to_time.last_month.strftime("%B")
    @xxxx_month = @xxx_month.to_time.last_month.strftime("%B")
    @xxxxx_month = @xxxx_month.to_time.last_month.strftime("%B")

    @x_total = 20
    @xx_total = 50
    @xxx_total = 200
    @xxxx_total = 100
    @xxxxx_total = 400
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
