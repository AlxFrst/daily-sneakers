class Price < ApplicationRecord
  belongs_to :sneaker, dependent: :destroy
end
