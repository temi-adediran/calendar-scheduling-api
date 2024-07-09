class RecurringHourSerializer
  include JSONAPI::Serializer
  attributes :MON, :TUE, :WED, :THU, :FRI, :SAT, :SUN

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 1.hour
end
