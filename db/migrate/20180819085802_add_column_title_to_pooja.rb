class AddColumnTitleToPooja < ActiveRecord::Migration[5.2]
  def change
    add_column :poojas, :Title, :string
  end
end
