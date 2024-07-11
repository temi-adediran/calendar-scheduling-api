class AvailableDateSerializer
  include JSONAPI::Serializer
  attributes :id, :date, :time_slots
end
