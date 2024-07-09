class CoachController < ApplicationController
  before_action :set_coach

  def available_slots_by_month
    month = params[:month].to_date
    available_slots = @coach.upcoming_available_slots(month)
    render json: available_slots
  end

  # private

  # def set_coach
  #   @coach ||= Coach.find(params[:id])
  # end

end
