class AddNewFk < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :item_id, :integer
    add_foreign_key :inventories, :items, column: :item_id, primary_key: "id"
  end
end
