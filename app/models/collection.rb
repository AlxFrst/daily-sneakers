class Collection < ApplicationRecord
  belongs_to :sneaker
  belongs_to :user
  belongs_to :condition
  belongs_to :status
end
