class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.string :model
      t.integer :votes
      t.integer :year
      t.string :color
      t.string :reference
      t.string :gender

      t.timestamps
    end
  end
end
