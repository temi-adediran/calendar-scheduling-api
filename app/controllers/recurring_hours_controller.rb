class RecurringHoursController < ApplicationController
  before_action :set_coach

  def get_recurring_hours
    if recurring_hours = @coach.try(:recurring_hour)
      recurring_hour_json = RecurringHourSerializer.new(recurring_hours).serializable_hash[:data][:attributes].to_json
      render json: recurring_hour_json
    else
      render json: recurring_hours
    end
  end

  def post_recurring_hours
    recurring = @coach.try(:recurring_hour) ? update_recurring_hours : create_recurring_hours

    if recurring
      render json: {message: "Saved successfully."}, status: :created
    else
      render json: recurring.errors, status: :unprocessable_entity
    end
  end

  private

  def create_recurring_hours
    @coach.create_recurring_hour(symbolized_params)
  end

  def update_recurring_hours
    @coach.recurring_hour.update(symbolized_params)
  end

  def set_coach
    @coach ||= Coach.find(5)
  end

  def symbolized_params
    JSON.parse(params[:recurring_hour].to_json, {symbolize_names: true})
  end

  def recurring_hour_params
    params.require(:recurring_hour).permit(:MON, :TUE, :WED, :THUR, :FRI, :SAT, :SUN)
  end
end
