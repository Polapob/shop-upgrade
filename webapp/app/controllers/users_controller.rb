class UsersController < ApplicationController
    skip_before_action :auth, only: [:create, :new]
    before_action :admin_only, only: [:destroy]

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

    def reset_password
        print("Hello")
        password = change_password_params[:password]
        confirm_password = change_password_params[:confirm_password]
        if password != confirm_password 
            flash[:notice] = "Password and Confirm password mismatch"
            redirect_to profile_path
            return 
        end
        @user = User.update(current_user.id,:password => password )
        flash[:notice] = "Successfully Reset Password"
        redirect_to profile_path
    end

    def show 
        @users = User.all
    end

    private
        def user_params
            params.require(:user).permit(:email,:name,:password,:user_type)
        end
        
        def change_password_params
            params.require(:change_password).permit(:password,:confirm_password)
        end
        
end
