class Inventory < ApplicationRecord
    belongs_to :item, foreign_key: "item_id", primary_key:"id",optional:true 
    belongs_to :user, foreign_key: "buyer_id", primary_key: "id",optional:true
end