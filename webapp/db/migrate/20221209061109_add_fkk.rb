class AddFkk < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :inventories, :users, column: :buyer_id,primary_key: "id"
    add_foreign_key :inventories, :users, column: :seller_id,primary_key: "id"
  end
end
