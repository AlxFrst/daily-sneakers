class Sneaker < ApplicationRecord
  paginates_per 20
  has_many :prices
  validates :reference, presence: true, uniqueness: true
end
