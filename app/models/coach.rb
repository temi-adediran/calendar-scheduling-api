class Coach < ApplicationRecord
  has_one :user, as: :memberable
  has_many :available_dates
  has_one :recurring_hour
  has_many :bookings

  def upcoming_available_slots(month)
    # {"1/4/24" => ["9:00", "12:00"], "2/4/24" => ["8:00", "12:00"], ...., "31/4/24": []}

    # if month is current month, return dates from tomorrow, else return all month dates
    all_month = month.month === Date.current.month ? Date.tomorrow..Date.current.end_of_month : month.all_month.map{|date| date }


    available_slots = all_month.inject({}) do |month_hash, date|
      formattedDate = date.strftime("%d/%m/%Y")
      month_hash[formattedDate] = get_unbooked_time_slots(date, month)
      month_hash
    end

    available_slots
  end

  private

  def get_unbooked_time_slots(date, month)
    booked_time_slots = self.bookings.upcoming.map(&:time_booked)
    time_slot = get_available_time_slots(date, month)

    time_slot.select{|time| !booked_time_slots.include? "#{date} #{time}".to_datetime }
  end

  def get_available_time_slots(date, month)
    available_dates_arr = upcoming_dates(month).map(&:date)

    if available_dates_arr.include?(date)
      upcoming_dates(month).find_by_date(date).time_slots
    elsif recurring_hour
      day = date.strftime("%^a")
      self.recurring_hour[day]
    else
      []
    end
  end

  def upcoming_dates(month)
    self.available_dates.upcoming.per_month(month)
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
