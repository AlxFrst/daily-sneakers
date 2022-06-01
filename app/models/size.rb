class Size < ApplicationRecord
  has_many :users
  has_many :sneakers, dependent: :destroy
end
