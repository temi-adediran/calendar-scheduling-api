class Coach < ApplicationRecord
  has_one :user, as: :memberable
  has_many :available_dates
  has_one :recurring_hour
  has_many :bookings

  def available_times
    # result = {"1/4/24" => ["9:00", "12:00"], "2/4/24" => ["8:00", "12:00"], ...., "31/4/24": []}
    # for each month, set date as keys
    # check if specific available_date is set, if yes set it
    # else check if recurring_hours is set, if yes set it
    # else return []
  end
end

# == Schema Information
#
# Table name: coaches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
