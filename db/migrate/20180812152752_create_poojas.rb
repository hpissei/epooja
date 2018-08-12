class CreatePoojas < ActiveRecord::Migration[5.2]
  def change
    create_table :poojas do |t|
      t.string :Type,limit:1
      t.string :Description
      t.float :Price

      t.timestamps
    end
  end
end
