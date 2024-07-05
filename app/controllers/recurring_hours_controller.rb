class RecurringHoursController < ApplicationController
  def get_recurring_hours
    if recurring_hours = Coach.last.try(:recurring_hour)
      recurring_hour_json = RecurringHourSerializer.new(recurring_hours).serializable_hash[:data][:attributes].to_json
      render json: recurring_hour_json
    else
      render json: recurring_hours
    end
  end
end
