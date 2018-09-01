class AddForeignKeysToPlaceBid < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :place_bids,:orders
    add_foreign_key :place_bids,:users
  end
end
