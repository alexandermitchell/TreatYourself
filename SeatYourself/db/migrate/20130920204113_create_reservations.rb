class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time_slot
      t.integer :customer_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
