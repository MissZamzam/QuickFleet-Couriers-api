class OrderstatusSerializer
  include JSONAPI::Serializer
  attributes :id, :senderName, :receiverName, :natureOfGoods, :pickup, :destination
  has_one :status
end
