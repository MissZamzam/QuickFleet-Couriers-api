class Receipt < ApplicationRecord
    # has_one :tracking
    # belongs_to :delivery
      belongs_to :order


    validates :receipt_no, uniqueness: true

    validates :sender_name, :receiver_name, :destination, :nature_of_goods, :receipt_no,  presence: true
    validates :nature_of_goods, inclusion: {in: %w(Flammable  Fragile  Perishable  Bulk  Medicals )}
    validates :amount_paid, presence: true, numericality: { greater_than: 300, less_than: 20000 }
end
 