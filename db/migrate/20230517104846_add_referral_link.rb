class AddReferralLink < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :referral_link, :string
  end
end
