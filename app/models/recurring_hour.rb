class RecurringHour < ApplicationRecord
  belongs_to :coach
end

# == Schema Information
#
# Table name: recurring_hours
#
#  id         :bigint           not null, primary key
#  FRI        :string           default([]), is an Array
#  MON        :string           default([]), is an Array
#  SAT        :string           default([]), is an Array
#  SUN        :string           default([]), is an Array
#  THUR       :string           default([]), is an Array
#  TUE        :string           default([]), is an Array
#  WED        :string           default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :bigint
#
# Indexes
#
#  index_recurring_hours_on_coach_id  (coach_id)
#
