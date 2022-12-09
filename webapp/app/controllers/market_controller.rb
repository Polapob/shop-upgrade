class MarketController < ApplicationController
  def index
      @list_items = Item.where(user_id:current_user.id)
  end

  def showAll
      @markets = Market.all
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

  def buy
     if buy_market_params[:qty].to_i < 0
      flash[:notice] = "You cannot pass negative value in Qty"
      redirect_to my_market_path
      return 
     elsif buy_market_params[:qty].to_i > Market.find_by(item_id: buy_market_params[:item_id]).stock
      flash[:notice] = "You cannot buy item more than the number of stock."
      redirect_to my_market_path
      return 
     else 
     @inventory = Inventory.new(buyer_id:current_user.id,seller_id:buy_market_params[:seller_id],qty:buy_market_params[:qty].to_i,item_id:buy_market_params[:item_id])
     # TODO Reduce number of the stock
     respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventories_path , notice: "You successfully bought the item." }
        format.json { render :show, status: :created, location: @market }
      else
        format.html { render my_market_path , status: :unprocessable_entity }
        format.json { render json: @inventories.errors, status: :unprocessable_entity }
      end
    end
     end
  end 

  def edit_market
    if Market.where(id:params[:id]).exists?
      @market = Market.find(params[:id])
      @market.price = market_params[:price]
      @market.stock = market_params[:stock]

      respond_to do |format|
        if @market.save
          format.html { redirect_to my_inventory_path , notice: "Item was successfully created." }
          format.json { render :show, status: :created, location: @market }
        else
          format.html { render '/market/edit/' + params[:id]  , status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end  
      return 
    end 
    respond_to do |format|
      format.html { render '/market/' + params[:id]  , notice: "You need to create market before edit" }
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end 
  
  def edit
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

  def buy_market_params
    params.require(:market).permit(:item_id,:seller_id,:qty)
  end
end
