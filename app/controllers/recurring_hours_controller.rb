class RecurringHoursController < ApplicationController
  before_action :set_coach

  def get_recurring_hours
    if recurring_hour = @coach.try(:recurring_hour)
      recurring_hour_json = RecurringHourSerializer.new(recurring_hour).serializable_hash[:data][:attributes].to_json
      render json: recurring_hour_json
    else
      render json: recurring_hour
    end
  end

  def post_recurring_hours
    recurring = @coach.try(:recurring_hour) ? update_recurring_hours : create_recurring_hours

    if recurring
      touch_coach
      render json: {message: "Saved successfully."}, status: :created
    else
      render json: {error: "Not successful. Try again."}, status: :unprocessable_entity
    end
  end

  private

  def create_recurring_hours
    @coach.create_recurring_hour(symbolized_params(params[:recurring_hour]))
  end

  def update_recurring_hours
    @coach.recurring_hour.update(symbolized_params(params[:recurring_hour]))
  end

  def recurring_hour_params
    params.require(:recurring_hour).permit(:MON, :TUE, :WED, :THUR, :FRI, :SAT, :SUN)
  end
end
