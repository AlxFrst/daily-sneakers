class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :nickname, :string
    add_column :users, :coutry, :string
    add_column :users, :wallet, :integer
    add_reference :users, :sizes, null: false, foreign_key: true
    add_column :users, :birthdate, :date
  end
end
