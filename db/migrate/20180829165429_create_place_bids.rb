class CreatePlaceBids < ActiveRecord::Migration[5.2]
  def change
    create_table :place_bids do |t|
      t.integer :user_id
      t.integer :order_id
      t.datetime :placed_at_datetime
      t.string :bid_status, limit: 1
      t.timestamps
    end
  end
end
