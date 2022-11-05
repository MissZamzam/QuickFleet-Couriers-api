class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :location
      t.string :telephone

      t.timestamps
    end
  end
end
