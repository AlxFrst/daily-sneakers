class CreateWishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :price_alert_float

      t.timestamps
    end
  end
end
