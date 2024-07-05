class CreateAvailableSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :available_slots do |t|
      t.string :date, null: false
      t.string :time_slots, array: true, default: []
      t.references :coach

      t.timestamps
    end
    add_index :available_slots, :date
  end
end
