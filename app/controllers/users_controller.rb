require 'pry'
class UsersController < ApplicationController
    # def new 
    #     @user = User.new
    # end 

    def create
        # binding.pry
        @user = User.create(user_params)
        if params[:user][:password] == params[:user][:password_confirmation]
            session[:user_id] = @user.id 
        else 
            redirect_to new_user_path
        end
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end
