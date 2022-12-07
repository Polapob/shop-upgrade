class MarketController < ApplicationController
  def index
  end


  def new
    @item = Item.find(params[:id])
    if !@item.enable
      flash[:notice] = "You need to enable this item first for sale"
    end 


    rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.to_s }, notice: :not_found
  end 

  private 
  def market_params
    params.require(:market).permit(:user_id,:item_id,:stock,:price,)
  end
end
