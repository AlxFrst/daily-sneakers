class SneakersController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "brand ILIKE :query OR model ILIKE :query"
      @sneakers = Sneaker.where(sql_query, query: "%#{params[:query]}%")
    else
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
      else
        @sneakers = Sneaker.all
      end
      @sneakers_page = Kaminari.paginate_array(@sneakers).page params[:page]
      @prices = Price.all
    end
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end
end
