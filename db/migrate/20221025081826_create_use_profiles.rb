class CreateUseProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :use_profiles do |t|
      t.string :avatar
      t.string :name
      t.string :email
      t.string :telephone
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
