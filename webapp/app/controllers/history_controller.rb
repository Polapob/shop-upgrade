class HistoryController < ApplicationController
  def sale
    @history = Inventory.where(seller_id:current_user.id)
  end

  def purchase
    @history = Inventory.where(buyer_id:current_user.id)
  end
end
