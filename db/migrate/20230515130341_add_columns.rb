class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname,  :string
    add_column :users, :lastname, :string
    add_column :users, :phone_number, :string
    add_column :users, :username, :string
    add_column :users, :unique_id, :string
    add_column :users, :balance, :decimal
  end
end

