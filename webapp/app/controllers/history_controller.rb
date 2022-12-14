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
    @start_date = params[:start_date]
    @end_date = params[:end_date]

    if @start_date && @end_date then
      if (@start_date > @end_date)
        redirect_to "/top_seller", notice: "Invalid start and end date"
      end

      @sellers = Inventory.select("users.email", "users.name", "SUM(inventories.price*inventories.qty) as total_price")
      .where("inventories.created_at between ? and ?", @start_date, @end_date)
      .joins("left join users on users.id = inventories.seller_id")
      .group("users.email", "users.name")
      .order("total_price DESC")
      return
    end

    @sellers = Inventory.select("users.email", "users.name", "SUM(inventories.price*inventories.qty) as total_price")
    .joins("left join users on users.id = inventories.seller_id")
    .group("users.email", "users.name")
    .order("total_price DESC")
  end
end
