class AvailableDate < ApplicationRecord
  belongs_to :coach

  scope :upcoming, -> { where('date > ?', Date.current) }
  scope :upcoming_with_current, -> { where('date > ?', Date.yesterday) }

  scope :per_month, ->(month) { where(date: month.all_month ) }
end

# == Schema Information
#
# Table name: available_dates
#
#  id         :bigint           not null, primary key
#  date       :date             not null
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
