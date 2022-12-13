class ApplicationController < ActionController::Base
  before_action :auth

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    rescue ActiveRecord::RecordNotFound 
    
    session[:user_id] = nil
    @current_user = nil
    @is_user_login = false
    redirect_to '/login' , notice: "User Not found in Database" 
  end

  def is_user_login
    @is_user_login = !!session[:user_id]
  end

  def auth
    if !session[:user_id]
      redirect_to login_path, notice: "Login Required"
    end
  end

  def no_buyer_entry
    if session[:user_type] == "buyer"
      redirect_to root_path, notice: "Permission Denied : No Buyer!"
      return
    end
  end

  def no_seller_entry
    if session[:user_type] == "seller"
      redirect_to root_path, notice: "Permission Denied : No Seller!"
      return
    end
  end
  
  def admin_only
    if session[:user_type] != "admin"
      redirect_to root_path, notice: "Permission Denied : Admin Only"
    end
  end

  helper_method :current_user, :is_user_login
end
