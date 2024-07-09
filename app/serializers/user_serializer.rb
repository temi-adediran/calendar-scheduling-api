class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :phone_no
end
