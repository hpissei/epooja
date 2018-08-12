class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :Pooja_id
      t.integer :User_id
      t.date :Book_date
      t.time :Book_time
      t.string :Book_status,limit:1

      t.timestamps
    end
  end
end
