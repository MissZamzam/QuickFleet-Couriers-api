class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :receiver_name, :receiver_contact, :pickup_instructions, :delivery_instructions, :package_type, :package_details
end
