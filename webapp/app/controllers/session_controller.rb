class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successful"
      redirect_to "/"
    else
      flash[:notice] = "Invalid Email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logout successful"
    redirect_to '/'
  end
end
