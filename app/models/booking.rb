class Booking < ApplicationRecord
  belongs_to :coach
  belongs_to :student

  scope :upcoming, -> { where('time_booked > ?', DateTime.current) }
  scope :past, -> { where('time_booked < ?', DateTime.current) }
end


# == Schema Information
#
# Table name: bookings
#
#  id          :bigint           not null, primary key
#  note        :text
#  rating      :integer
#  time_booked :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  coach_id    :bigint
#  student_id  :bigint
#
# Indexes
#
#  index_bookings_on_coach_id    (coach_id)
#  index_bookings_on_student_id  (student_id)
#
