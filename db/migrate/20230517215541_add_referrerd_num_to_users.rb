class AddReferrerdNumToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :referred_num, :integer
  end
end
