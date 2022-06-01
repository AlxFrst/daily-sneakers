class SneakerChangeYearToRelease < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :year
    add_column :sneakers, :release, :date
  end
end
