class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :region_id
      t.string :postal_code
      t.integer :country_id
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
