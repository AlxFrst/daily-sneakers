class CreateCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.references :sneakers, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.references :conditions, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.decimal :price_buy
      t.date :buying_date

      t.timestamps
    end
  end
end
