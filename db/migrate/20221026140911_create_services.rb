class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :image_url
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
