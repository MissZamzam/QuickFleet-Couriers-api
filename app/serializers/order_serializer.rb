class OrderSerializer < ActiveModel::Serializer
  attributes :id, :senderName, :receiverName, :natureOfGoods, :pickup, :destination
end
