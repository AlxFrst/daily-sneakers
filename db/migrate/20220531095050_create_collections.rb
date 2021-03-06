class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.decimal :price_buy
      t.date :buying_date

      t.timestamps
    end
  end
end
