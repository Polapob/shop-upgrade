class MainController < ApplicationController
  def main
    if !session[:user_id]
      redirect_to "/login"
    end
    
  end
end
