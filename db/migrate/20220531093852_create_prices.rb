class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.date :timestamp
      t.references :sneakers, null: false, foreign_key: true
      t.decimal :price
      t.string :market

      t.timestamps
    end
  end
end
