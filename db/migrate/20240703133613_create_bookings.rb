class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :time_booked
      t.integer :rating
      t.text :note
      t.references :coach
      t.references :student

      t.timestamps
    end
  end
end
