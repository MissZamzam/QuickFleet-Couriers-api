class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.integer :order_id
      t.string :content

      t.timestamps
    end
  end
end
