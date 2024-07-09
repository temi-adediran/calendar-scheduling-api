class ChangeThurRecurringHours < ActiveRecord::Migration[7.1]
  def change
    rename_column :recurring_hours, :THUR, :THU
  end
end
