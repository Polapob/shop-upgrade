class AddFk < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :item_id
    #change_column :item_id, :item_id, :integer
    #add_foreign_key :inventories, :items, column: :item_id, primary_key: "id"
  
  end
end
