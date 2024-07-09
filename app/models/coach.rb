class Coach < ApplicationRecord
  has_one :user, as: :memberable
  has_many :available_dates
  has_one :recurring_hour
  has_many :bookings

  def upcoming_available_slots(month)
    # {"1/4/24" => ["9:00", "12:00"], "2/4/24" => ["8:00", "12:00"], ...., "31/4/24": []}
    all_month = month.all_month.map{|date| date }
    available_slots = all_month.inject({}) do |month_hash, date|
      formattedDate = date.strftime("%d/%m/%Y")
      month_hash[formattedDate] = get_time_slot(date, month)
      month_hash
    end

    available_slots
  end

  private

  def upcoming_dates(month)
    self.available_dates.upcoming.per_month(month)
    # add scope for booked dates and remove from list
  end

  def get_time_slot(date, month)
    available_dates_arr = upcoming_dates(month).map(&:date)

    if available_dates_arr.include?(date)
      upcoming_dates(month).find_by_date(date).time_slots
    elsif recurring_hour
      day = date.strftime("%^a")
      recurring_hour[day]
    else
      []
    end
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
