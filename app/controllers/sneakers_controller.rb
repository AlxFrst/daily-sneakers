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
  end
end
