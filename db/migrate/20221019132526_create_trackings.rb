class CreateTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :trackings do |t|
      # t.integer :user_id
      # t.integer :receipt_id
      t.string :pickup
      t.string :destination
      t.integer :order_id

      t.timestamps
    end
  end
end
