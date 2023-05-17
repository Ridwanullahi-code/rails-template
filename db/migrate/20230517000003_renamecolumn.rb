class Renamecolumn < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :balance, :integer, :default => 200
    change_column :users, :bonus, :integer, :default => 200
    change_column :transactions, :amount, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
