class Sneaker < ApplicationRecord
  belongs_to :size
  has_one :price
end
