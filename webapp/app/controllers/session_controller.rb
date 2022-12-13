class SessionController < ApplicationController
  skip_before_action :auth, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = user.user_type
      flash[:notice] = "Login successful"
      redirect_to "/"
    else
      flash[:notice] = "Invalid Email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    flash[:notice]="Logout successful"
    redirect_to '/'
  end
end
