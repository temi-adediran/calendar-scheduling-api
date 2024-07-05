class RecurringHourSerializer
  include JSONAPI::Serializer
  attributes :MON, :TUE, :WED, :THUR, :FRI, :SAT, :SUN
end
