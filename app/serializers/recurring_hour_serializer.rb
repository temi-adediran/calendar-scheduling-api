class RecurringHourSerializer
  include JSONAPI::Serializer
  attributes :MON, :TUE, :WED, :THU, :FRI, :SAT, :SUN
end
