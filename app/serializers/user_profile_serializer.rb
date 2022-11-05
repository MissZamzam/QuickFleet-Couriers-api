class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :location, :telephone
end
