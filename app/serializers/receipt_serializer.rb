class ReceiptSerializer < ActiveModel::Serializer
  attributes :id, :receipt_no, :sender_name, :receiver_name, :amount_paid, :nature_of_goods, :pickup, :destination

  belongs_to :order
end
