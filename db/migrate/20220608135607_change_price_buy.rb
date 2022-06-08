class ChangePriceBuy < ActiveRecord::Migration[6.1]
  def change
    change_column :collections, :price_buy, :integer
  end
end
