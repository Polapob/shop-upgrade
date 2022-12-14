class Inventory < ApplicationRecord
    belongs_to :item, foreign_key: "item_id", primary_key:"id",optional:true 
    belongs_to :buyer, :class_name => "User", foreign_key: "buyer_id", primary_key: "id",optional:true
    belongs_to :seller, :class_name => "User", foreign_key: "seller_id", primary_key: "id",optional:true
end
