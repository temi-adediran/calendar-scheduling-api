class CreateAvailableDates < ActiveRecord::Migration[7.1]
  def change
    create_table :available_dates do |t|
      t.string :date, null: false
      t.string :time_slots, array: true, default: []
      t.references :coach

      t.timestamps
    end
    add_index :available_dates, :date
  end
end
