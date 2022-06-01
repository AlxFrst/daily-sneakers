class PriceChangeDecimalToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :prices, :price, :float
  end
end
