class MainController < ApplicationController
  def main
    @user_type = session[:user_type]
  end
end
