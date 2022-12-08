class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.belongs_to :user, foreign_key: true 
      t.belongs_to :item, foreign_key: true
      t.float :price
      t.integer :stock
      t.timestamps
    end
  end
end
