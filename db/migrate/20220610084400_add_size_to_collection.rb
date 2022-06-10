class AddSizeToCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :collections, :size, :float
  end
end
