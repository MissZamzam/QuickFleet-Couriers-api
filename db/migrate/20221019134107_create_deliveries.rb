class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :receiver_name
      t.string :receiver_contact
      t.text :pickup_instructions
      t.text :delivery_instructions
      t.string :package_type
      t.string :package_details

      t.timestamps
    end
  end
end
