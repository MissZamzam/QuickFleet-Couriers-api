class UseProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :firstName, :lastName, :telephone, :location
end
