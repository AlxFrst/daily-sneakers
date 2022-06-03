class Sneaker < ApplicationRecord
  paginates_per 20
  has_many :prices, dependent: :destroy
  validates :reference, presence: true, uniqueness: true
end
