class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :sender_name
      t.string :receiver_name
      t.string :nature_of_goods
      t.string :pickup
      t.string :destination
      t.integer :use_profile_id

      t.timestamps
    end
  end
end
