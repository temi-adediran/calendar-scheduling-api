class BookingsController < ApplicationController
  before_action :set_student, only: [:book_session, :upcoming_session]
  before_action :set_coach

  def book_session
    time_booked = "#{params[:date]} #{params[:time]}".to_datetime

    if Booking.new(time_booked:, coach: @coach, student: @student).save
      touch_coach
      render json: { message: "Booking was successful." }, status: :created
    else
      render json: { error: "Not successful. Please try again!" }, status: :unprocessable_entity
    end
  end

  def upcoming_session
    klass = params[:user_type].titleize.constantize
    klass_id = params[:user_type] === "coach" ? @coach.id : @student.id

    sessions = Rails.cache.fetch([@coach, :upcoming_session]) do
      klass.find_by_id(klass_id).bookings.upcoming
    end
    sessions_json = BookingSerializer.new(sessions).serializable_hash[:data].map{|v| v[:attributes] }.to_json

    render json: sessions_json, status: :ok
  end

  def past_session
    sessions = Rails.cache.fetch([@coach, :past_session]) do
      @coach.bookings.past
    end

    sessions_json = BookingSerializer.new(sessions).serializable_hash[:data].map{|v| v[:attributes] }.to_json
    render json: sessions_json, status: :ok
  end

  def post_rating
    booking = @coach.bookings.find_by_id(params[:id])

    if booking.update(rating: params[:rating], note: params[:note])
      touch_coach
      render json: {message: "Update successful"}, status: :ok
    else
      render json: { error: "Update not successful. Please try again!" }, status: :unprocessable_entity
    end
  end
end
