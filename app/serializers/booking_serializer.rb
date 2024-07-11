class BookingSerializer
  include JSONAPI::Serializer
  attributes :id, :note, :rating, :time_booked

  attribute :start_time do |obj|
    obj.time_booked.strftime("%H:%M")
  end

  attribute :coach_name do |obj|
    obj.coach.try(:user).try(:name)
  end

  attribute :coach_phone_no do |obj|
    obj.coach.try(:user).try(:phone_no)
  end

  attribute :student_name do |obj|
    obj.student.try(:user).try(:name)
  end

  attribute :student_phone_no do |obj|
    obj.student.try(:user).try(:phone_no)
  end
end
