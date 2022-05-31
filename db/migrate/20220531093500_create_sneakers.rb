class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.string :model
      t.integer :votes
      t.references :sizes, null: false, foreign_key: true
      t.integer :year
      t.string :color
      t.string :reference
      t.references :genders, null: false, foreign_key: true

      t.timestamps
    end
  end
end
