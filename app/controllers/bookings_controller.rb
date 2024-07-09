class BookingsController < ApplicationController
  before_action [:set_coach, :set_student], only: :book_session

  def book_session
    time_booked = "#{params[:date]} #{params[:time]}".to_datetime

    if booking = Booking.new(time_booked:, coach: @coach, student: @student).save
      render json: { message: "Booking was successful." }, status: :created
    else
      render json: booking.errors, status: :unprocessable_entity
    end
  end

  def upcoming_session
  end

  def past_session
  end
end
