class AddFk < ActiveRecord::Migration[7.0]
  def change
    add_references :items, :user 
    add_foreign_key :items,:users
  end
end
