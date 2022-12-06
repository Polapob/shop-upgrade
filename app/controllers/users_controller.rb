class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice]="Signup successful"
            redirect_to '/'
        else
            print "failed"
            flash[:notice]= "User already signup with the email"
            redirect_to users_new_path
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        flash[:notice] = "Successfully delete user"
    end

    def info
    end

    def show 
        @users = User.all
    end

    private
        def user_params
            params.require(:user).permit(:email,:name,:password,:user_type)
        end
        
end
