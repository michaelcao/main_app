class AddIndexToUsersTable < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  	add_index :users, :referral_code
  end
end
