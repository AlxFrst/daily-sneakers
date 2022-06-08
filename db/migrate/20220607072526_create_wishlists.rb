class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price_alert

      t.timestamps
    end
  end
end
