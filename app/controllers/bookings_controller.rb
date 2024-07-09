class BookingsController < ApplicationController
  before_action :set_student, only: :book_session
  before_action :set_coach, only: [:past_session, :post_rating, :book_session]

  def book_session
    time_booked = "#{params[:date]} #{params[:time]}".to_datetime

    if Booking.new(time_booked:, coach: @coach, student: @student).save
      render json: { message: "Booking was successful." }, status: :created
    else
      render json: { error: "Save not successful. Please try again!" }, status: :unprocessable_entity
    end
  end

  def upcoming_session
    klass = params[:user_type].titleize.constantize
    sessions = klass.last.bookings.upcoming
    sessions_json = BookingSerializer.new(sessions).serializable_hash[:data].map{|v| v[:attributes] }.to_json

    render json: sessions_json, status: :ok
  end

  def past_session
    sessions = @coach.bookings.past
    sessions_json = BookingSerializer.new(sessions).serializable_hash[:data].map{|v| v[:attributes] }.to_json

    render json: sessions_json, status: :ok
  end

  def post_rating
    booking = @coach.bookings.find_by_id(params[:id])

    if booking.update(rating: params[:rating], note: params[:note])
      render json: {message: "Update successful"}, status: :ok
    else
      render json: { error: "Update not successful. Please try again!" }, status: :unprocessable_entity
    end
  end
end
