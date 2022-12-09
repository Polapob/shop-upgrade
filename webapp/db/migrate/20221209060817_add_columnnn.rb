class AddColumnnn < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :buyer_id, :integer
    add_column :inventories, :seller_id, :integer
  end
end
