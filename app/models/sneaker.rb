class Sneaker < ApplicationRecord
  has_many :prices

  validates :reference, presence: true, uniqueness: true
end
