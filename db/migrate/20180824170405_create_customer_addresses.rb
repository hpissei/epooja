class CreateCustomerAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_addresses do |t|
      t.integer :userId
      t.string :state
      t.string :city
      t.string :permanentAddress
      t.string :temporaryAddress
      t.string :addressSelected, limit: 1

      t.timestamps
    end
  end
end
