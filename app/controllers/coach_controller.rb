class CoachController < ApplicationController
  before_action :set_coach, only: :available_slots_by_month

  def available_slots_by_month
    month = params[:month].to_date
    available_slots = @coach.upcoming_available_slots(month)
    render json: available_slots
  end

  def get_all_coaches
    coaches = Coach.all
    coaches_josn = CoachSerializer.new(coaches).serializable_hash[:data].map{|v| v[:attributes] }.to_json
    render json: coaches_josn
  end

  # private

  # def set_coach
  #   @coach ||= Coach.find(params[:id])
  # end

end
