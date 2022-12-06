class ApplicationController < ActionController::Base
def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def is_user_login
    @is_user_login = !!session[:user_id]
end

helper_method :current_user, :is_user_login
end
