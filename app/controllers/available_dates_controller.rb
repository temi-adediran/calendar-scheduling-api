class AvailableDatesController < ApplicationController
  before_action :set_coach

  def get_available_dates
    render json: coach.available_times
  end

  private

  def set_coach
    @coach ||= Coach.last.includes(:available_dates)
  end
end
