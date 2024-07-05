class AvailableSlotsController < ApplicationController
  def get_available_slots
    coach = Coach.last
    render json: coach.try(:available_slots)
  end
end
