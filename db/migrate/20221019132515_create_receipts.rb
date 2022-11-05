class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.string :receipt_no
      t.string :sender_name
      t.string :receiver_name
      t.integer :amount_paid
      t.string :nature_of_goods
      t.string :pickup
      t.string :destination
      t.integer :order_id

      t.timestamps
    end
  end
end
