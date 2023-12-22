class CreateDelivereds < ActiveRecord::Migration[7.0]
  def change
    create_table :delivereds do |t|
      t.string :tracking_id
      t.string :card_id
      t.string :user_contact
      t.string :delivered_time
      t.string :comment

      t.timestamps
    end
  end
end
