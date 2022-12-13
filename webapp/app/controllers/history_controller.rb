class HistoryController < ApplicationController
  before_action :no_buyer_entry, only: [:get_top_seller, :sale]
  before_action :no_seller_entry, only: [:purchase]

  def sale
    @history = Inventory.where(seller_id:current_user.id)
  end

  def purchase
    @history = Inventory.where(buyer_id:current_user.id)
  end

  def get_top_seller
    @sellers = Inventory.select("users.email", "users.name", "SUM(inventories.price*inventories.qty) as total_price")
    .joins("left join users on users.id = inventories.seller_id")
    .group("users.email", "users.name")
    .order("total_price DESC")
  end

end
