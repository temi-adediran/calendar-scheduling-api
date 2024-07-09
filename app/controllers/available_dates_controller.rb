class AvailableDatesController < ApplicationController
  before_action :set_coach

  def get_available_dates
    available_dates = @coach.available_dates.upcoming
    available_dates_json = AvailableDateSerializer.new(available_dates).serializable_hash[:data].map{|v| v[:attributes] }.to_json
    render json: available_dates_json, status: :ok
  end

  def post_available_dates
    available_date = @coach.available_dates.find_by_date(params[:available_dates][:date])

    save_available_date = available_date ? update_available_date(available_date) : create_available_date

    if save_available_date
      render json: {message: "Saved successfully."}, status: :created
    else
      render json: {error: "Not successful."}, status: :unprocessable_entity
    end
  end

  def delete_available_date
    id = params[:available_dates][:available_date_id]
    delete_available_date = @coach.available_dates.find_by_id(id).destroy
    render json: { message: "Deleted successfully."}, status: :ok
  end

  private

  def create_available_date
    @coach.available_dates.new(symbolized_params(params[:available_dates])).save
  end

  def update_available_date(available_date)
    available_date.update(time_slots: params[:available_dates][:time_slots])
  end

  def date_param
    params[:available_dates][:date]
  end

  def time_slots_param
    params[:available_dates][:time_slots]
  end

  def available_dates_params
    params.require(:available_dates).permit(:available_date_id, :date, :time_slots)
  end
end
