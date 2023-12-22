class CreateDeliveryExceptions < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_exceptions do |t|
      t.string :tracking_id
      t.string :card_id
      t.string :user_contact
      t.string :exception_time
      t.string :comment

      t.timestamps
    end
  end
end
