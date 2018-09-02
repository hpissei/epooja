class AddForeignKeysToOrderTable < ActiveRecord::Migration[5.2]
  def change
    #add_foreign_key :orders, :poojas
    add_foreign_key :orders, :users
  end
end
