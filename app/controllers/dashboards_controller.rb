class DashboardsController < ApplicationController
  def wishlist
    @sneaker = Wishlist.where(user: current_user)
    total = 0
    @sneaker.each do |sneaker|
      total += Price.where(sneaker: sneaker.sneaker).last.price
    end

    # Je sais c'est horrible mais j'ai pas l'time <3
    @month = Date.today.strftime("%B")
    @x_month = @month.to_time.last_month.strftime("%B")
    @xx_month = @x_month.to_time.last_month.strftime("%B")
    @xxx_month = @xx_month.to_time.last_month.strftime("%B")
    @xxxx_month = @xxx_month.to_time.last_month.strftime("%B")
    @xxxxx_month = @xxxx_month.to_time.last_month.strftime("%B")

    #create a function give a little variation up or down the price
    def variation(price)
      variation = rand(0..100)
      if variation > 5
        price += variation
      else
        price -= variation
      end
      return price
    end

    @total = total
    @x_total = variation(total)
    @xx_total = variation(@x_total)
    @xxx_total = variation(@xx_total)
    @xxxx_total = variation(@xxx_total)
    @xxxxx_total = variation(@xxxx_total)
  end

  def collection
    @sneaker = Collection.where(user: current_user)
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

    #create a function give a little variation up or down the price
    def variation(price)
      variation = rand(0..80)
      if variation > 5
        price += variation
      else
        price -= variation
      end
      return price
    end

    @total = total
    @x_total = variation(total)
    @xx_total = variation(@x_total)
    @xxx_total = variation(@xx_total)
    @xxxx_total = variation(@xxx_total)
    @xxxxx_total = variation(@xxxx_total)
  end

  def profile
  end
end
