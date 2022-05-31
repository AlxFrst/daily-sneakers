class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|
      t.decimal :US
      t.decimal :EU
      t.decimal :UK

      t.timestamps
    end
  end
end
