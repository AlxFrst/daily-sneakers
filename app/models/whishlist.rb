class Whishlist < ApplicationRecord
  belongs_to :sneakers
  belongs_to :users
end
