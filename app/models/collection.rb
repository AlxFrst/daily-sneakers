class Collection < ApplicationRecord
  belongs_to :sneakers
  belongs_to :users
  belongs_to :conditions
  belongs_to :status
end
