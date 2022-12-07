class AddUserToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :user 
    add_foreign_key :items,:users
  end
end
