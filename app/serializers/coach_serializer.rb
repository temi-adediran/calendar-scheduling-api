class CoachSerializer
  include JSONAPI::Serializer
  attributes :id

  cache_options store: Rails.cache, namespace: 'jsonapi-serializer', expires_in: 12.hours

  attribute :name do |obj|
    obj.try(:user).try(:name)
  end
end
