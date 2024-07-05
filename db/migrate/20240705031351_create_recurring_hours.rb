class CreateRecurringHours < ActiveRecord::Migration[7.1]
  def change
    create_table :recurring_hours do |t|
      t.string :MON, array: true, default: []
      t.string :TUE, array: true, default: []
      t.string :WED, array: true, default: []
      t.string :THUR, array: true, default: []
      t.string :FRI, array: true, default: []
      t.string :SAT, array: true, default: []
      t.string :SUN, array: true, default: []
      t.references :coach

      t.timestamps
    end
  end
end
