class ChangePoojaIdColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :Pooja_id, :pooja_id
  end
end
