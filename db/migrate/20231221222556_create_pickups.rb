class CreatePickups < ActiveRecord::Migration[7.0]
  def change
    create_table :pickups do |t|
      t.string :tracking_id
      t.string :card_id
      t.string :user_contact
      t.string :pickup_time

      t.timestamps
    end
  end
end
