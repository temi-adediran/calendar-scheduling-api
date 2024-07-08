class AvailableDateSerializer
  include JSONAPI::Serializer
  attributes :date, :time_slots
end
