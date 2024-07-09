class AvailableDateSerializer
  include JSONAPI::Serializer
  attributes :date, :time_slots

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 30.minutes
end
