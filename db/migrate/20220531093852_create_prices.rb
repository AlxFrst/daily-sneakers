class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.date :timestamp
      t.decimal :price
      t.string :market
      t.float :size, null: false
      t.references :sneaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
