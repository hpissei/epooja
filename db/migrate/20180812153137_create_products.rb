class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :Product_name
      t.string :Other

      t.timestamps
    end
  end
end
