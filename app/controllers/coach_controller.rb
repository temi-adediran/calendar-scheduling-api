class CoachController < ApplicationController
  before_action :set_coach_by_id, only: :available_slots_by_month

  def available_slots_by_month
    month = params[:month].to_date

    available_slots = Rails.cache.fetch([@coach, :available_slots_by_month, month]) do
      @coach.upcoming_available_slots(month)
    end

    render json: available_slots
  end

  def get_all_coaches
    ids = Rails.cache.fetch([:coaches], expires_in: 30.minutes) do
      Coach.pluck(:id)
    end
    coaches = Coach.includes(:user).where(id: ids).to_a
    coaches_json = CoachSerializer.new(coaches).serializable_hash[:data].map{|v| v[:attributes] }.to_json
    render json: coaches_json
  end

  private

  def set_coach_by_id
    @coach ||= Coach.find(params[:id])
  end

end
