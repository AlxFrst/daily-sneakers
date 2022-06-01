class AddImgurlToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :imgurl, :string
  end
end
