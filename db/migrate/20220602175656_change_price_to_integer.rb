class ChangePriceToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :prices, :price, :integer
  end
end
