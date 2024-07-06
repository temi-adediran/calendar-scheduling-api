class AvailableDate < ApplicationRecord
  belongs_to :coach

  # enum :to_day, {1 => 'MON', 2 => 'TUE', 3 => 'WED', 4 => 'THUR', 5 => 'FRI', 6 => 'SAT', 7 => 'SUN'}
end

# == Schema Information
#
# Table name: available_dates
#
#  id         :bigint           not null, primary key
#  date       :string           not null
#  time_slots :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :bigint
#
# Indexes
#
#  index_available_dates_on_coach_id  (coach_id)
#  index_available_dates_on_date      (date)
#
