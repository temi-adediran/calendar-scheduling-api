class CoachSerializer
  include JSONAPI::Serializer
  attributes :id

  attribute :name do |obj|
    obj.try(:user).try(:name)
  end
end
