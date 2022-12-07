class MarketController < ApplicationController
  def index
      @list_items = Item.where(user_id:current_user.id)
  end

  def delete
      print("params =", params[:item_id])
      @market = Market.where(item_id: params[:item_id]).first
      @market.destroy
      print(@market)
      respond_to do |format|
        format.html { redirect_to my_inventory_path, notice: "Item was successfully remove from the market." }
        format.json { head :no_content }
      end
  end 
  
  def create 
    @market = Market.new(market_params)
    respond_to do |format|
      if @market.save
        format.html { redirect_to my_inventory_path , notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render '/market/' + params[:id]  , status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end 

  def new
    @item = Item.find(params[:id])
    if !@item[:enable] 
      flash[:notice] = "You need to enable this item first for sale"
      redirect_to my_inventory_path
      return  
    end 
   # print(@item.inspect)

    if @item[:user_id] != current_user[:id] || current_user.user_type != "seller"
      flash[:notice] = "You don't have permission to sale this item"
      return 
    end

    rescue ActiveRecord::RecordNotFound => e
    render json: { error: e.to_s }, notice: :not_found
  end 

  private 
  def market_params
    params.require(:market).permit(:user_id,:item_id,:stock,:price)
  end
end
