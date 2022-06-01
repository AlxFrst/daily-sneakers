class SizeChangeDecimalToFloar < ActiveRecord::Migration[6.1]
  def change
    change_column :sizes, :US, :float
    change_column :sizes, :EU, :float
    change_column :sizes, :UK, :float
  end
end
