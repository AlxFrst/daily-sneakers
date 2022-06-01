class SizeReferences < ActiveRecord::Migration[6.1]
  def change
    remove_reference :sneakers, :sizes, index: true, foreign_key: true
    add_reference :sneakers, :size, foreign_key: true
  end
end
