class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :image
      t.integer :phone_number
      t.string :website_url
      t.integer :owner_id

      t.timestamps
    end
    add_index :restaurants, [:owner_id, :created_at]
  end
end
