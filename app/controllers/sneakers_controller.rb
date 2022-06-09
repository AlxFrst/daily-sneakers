class SneakersController < ApplicationController
  def index
    if params[:brands] != "" && params[:sellers] != "" && params[:brands] && params[:sellers]
      query = "brand IN ('#{params[:brands].gsub(",", "','")}')
        AND prices.market IN ('#{params[:sellers].gsub(",", "','")}')
        AND prices.price BETWEEN #{params[:min]} AND #{params[:max]}"
      @sneakers = Sneaker.joins(:prices).where(query).group(:id)
    elsif params[:brands] != "" && params[:brands]
      @sneakers = Sneaker.joins(:prices).where("brand IN ('#{params[:brands].gsub(",", "','")}')
        AND prices.price BETWEEN #{params[:min].to_i} AND #{params[:max].to_i}").group(:id)
    elsif params[:sellers] != "" && params[:sellers]
      @sneakers = Sneaker.joins(:prices).where("prices.market IN ('#{params[:sellers].gsub(",", "','")}')
        AND prices.price BETWEEN #{params[:min].to_i} AND #{params[:max].to_i}").group(:id)
    elsif params[:min] != "" && params[:min]
      @sneakers = Sneaker.joins(:prices).where("prices.price BETWEEN #{params[:min].to_i} AND #{params[:max].to_i}").group(:id)
    elsif params[:search]
      @sneakers = Sneaker.where("brand LIKE '%#{params[:search].capitalize}%' OR model LIKE '%#{params[:search].capitalize}%'")
    else
      @sneakers = Sneaker.all
    end
    @sneakers_page = Kaminari.paginate_array(@sneakers).page params[:page]
    @prices = Price.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
    @day = Date.today.strftime("%d/%m/%Y")
    @x_day = @day.to_time.prev_day.strftime("%d/%m/%Y")
    @xx_day = @x_day.to_time.prev_day.strftime("%d/%m/%Y")
    @xxx_day = @xx_day.to_time.prev_day.strftime("%d/%m/%Y")
    @xxxx_day = @xxx_day.to_time.prev_day.strftime("%d/%m/%Y")
    @xxxxx_day = @xxxx_day.to_time.prev_day.strftime("%d/%m/%Y")
    @xxxxxx_day = @xxxxx_day.to_time.prev_day.strftime("%d/%m/%Y")

    def price_random(sneaker_price)
      num = sneaker_price
      return rand(4) if num < 0.3
      return rand(6) if num < 0.7
      return rand(10) if num < 0.9
      return rand(30)
    end

    if params[:size]
      @total = Price.where(sneaker_id: params[:id], size: params[:size]).order(price: :asc).first.price
      @x_total = @total - price_random(@total) + price_random(@total)
      @xx_total = @x_total - price_random(@x_total) + price_random(@x_total)
      @xxx_total = @xx_total - price_random(@xx_total) + price_random(@xx_total)
      @xxxx_total = @xxx_total - price_random(@xxx_total) + price_random(@xxx_total)
      @xxxxx_total = @xxxx_total - price_random(@xxxx_total) + price_random(@xxxx_total)
    else
      @total = Price.where(sneaker_id: params[:id]).first.price
      @x_total = @total - price_random(@total) + price_random(@total)
      @xx_total = @x_total - price_random(@x_total) + price_random(@x_total)
      @xxx_total = @xx_total - price_random(@xx_total) + price_random(@xx_total)
      @xxxx_total = @xxx_total - price_random(@xxx_total) + price_random(@xxx_total)
      @xxxxx_total = @xxxx_total - price_random(@xxxx_total) + price_random(@xxxx_total)
    end
  end
end
