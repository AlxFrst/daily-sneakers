class CreateWhishlists < ActiveRecord::Migration[6.1]
  def change
    create_table :whishlists do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :price_alert

      t.timestamps
    end
  end
end
