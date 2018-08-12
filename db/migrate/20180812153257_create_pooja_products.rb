class CreatePoojaProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :pooja_products do |t|
      t.integer :Pooja_id
      t.integer :Product_id
      t.float :Quantity

      t.timestamps
    end
  end
end
