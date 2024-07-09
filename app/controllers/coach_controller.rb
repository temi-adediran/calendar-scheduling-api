class CoachController < ApplicationController
  before_action :set_coach_by_id, only: :available_slots_by_month

  def available_slots_by_month
    month = params[:month].to_date
    available_slots = @coach.upcoming_available_slots(month)
    render json: available_slots
  end

  def get_all_coaches
    coaches = Coach.all
    coaches_json = CoachSerializer.new(coaches).serializable_hash[:data].map{|v| v[:attributes] }.to_json
    render json: coaches_json
  end

  private

  def set_coach_by_id
    @coach ||= Coach.find(params[:id])
  end

end
