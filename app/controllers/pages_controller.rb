class PagesController < ApplicationController
  def home
    @upcoming_sneakers = Sneaker.where(release: Date.today..Date.today + 7.days).order(release: :asc).limit(5)
  end
end
