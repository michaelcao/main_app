class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false, :limit => 64
      t.string :email, :null => false, :limit => 64
      t.text :address
      t.text :description
      t.date :birth_date
      t.text :school
      t.text :work
      t.text :languages
      t.string :referral_code
      t.string :referred_code
      t.integer :credit

      t.timestamps
    end
  end
end
