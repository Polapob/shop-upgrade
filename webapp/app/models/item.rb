class Item < ApplicationRecord
    has_one_attached :image
    has_one :market
    belongs_to :user
    has_many :inventories, foreign_key: "item_id", primary_key:"id"
end
